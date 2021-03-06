package DaxMailer::Schema::ResultSet::Subscriber;

use Moo;
extends 'DaxMailer::Schema::ResultSet';

use DateTime;
use DateTime::Duration;

sub campaign {
    my ( $self, $c ) = @_;
    $self->search_rs( { campaign => $c } );
}

sub subscribed {
    my ( $self ) = @_;
    $self->search_rs( { unsubscribed => 0 } );
}

sub unsubscribed {
    my ( $self ) = @_;
    $self->search_rs( { unsubscribed => 1 } );
}

sub verified {
    my ( $self ) = @_;
    $self->search_rs( { verified => 1 } );
}

sub unverified {
    my ( $self, $single_opt_in ) = @_;
    return $self->verified if $single_opt_in;
    $self->search_rs( { verified => 0 } );
}

sub bounced {
    my ( $self ) = @_;
    $self->search_rs({
        'me.email_address' => {
            -in => $self->rs('Subscriber::Bounce')
                            ->bounced
                            ->get_column('email_address')
                            ->as_query
        }
    });
}

sub unbounced {
    my ( $self ) = @_;
    $self->search_rs({
        'me.email_address' => {
            -not_in => $self->rs('Subscriber::Bounce')
                            ->bounced
                            ->get_column('email_address')
                            ->as_query
        }
    });
}

sub mail_unsent {
    my ( $self, $campaign, $email ) = @_;
    $self->search_rs( {
        'me.email_address' => { -not_in => \[
                'SELECT email_address
                 FROM subscriber_maillog
                 WHERE campaign = ?
                 AND email_id = ?',
                ( $campaign, $email )
            ],
        }
    } );
}

sub verification_mail_unsent_for {
    my ( $self, $campaign ) = @_;
    $self->search_rs( {
        'me.email_address' => { -not_in => \[
                'SELECT email_address
                 FROM subscriber_maillog
                 WHERE campaign = ?
                 AND email_id = \'v\'',
                $campaign
            ],
        }
    } );
}

sub by_days_ago {
    my ( $self, $days ) = @_;
    my $today = DateTime->now->truncate( to => 'day' );
    my $end = $self->format_datetime(
        $today->subtract( days => ( $days - 1 ) )
    );
    my $start = $self->format_datetime(
        $today->subtract( days => 1 )
    );

    $self->search_rs( {
        created => { -between => [ $start, $end ] }
    } );
}

sub exists {
    my ( $self, $email, $campaigns ) = @_;
    $self->search( \[ 'LOWER( email_address ) = ?', lc( $email ) ] )
         ->search( { campaign => $campaigns } )
         ->one_row;
}

1;
