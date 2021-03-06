requires 'AWS::SNS::Verify';
requires 'Cache::FastMmap';
requires 'Cpanel::JSON::XS';
requires 'Data::Printer';
requires 'DBD::Pg';
requires 'DBIx::Class::Candy';
requires 'DBIx::Class::Core';
requires 'DBIx::Class::Helpers';
requires 'DBIx::Class::InflateColumn::Serializer';
requires 'DBIx::Class::ResultSet';
requires 'DBIx::Class::Schema';
requires 'DBIx::Class::TimeStamp';
requires 'Dancer2', '0.205000';
requires 'Dancer2::Plugin';
requires 'Dancer2::Plugin::Auth::HTTP::Basic::DWIW';
requires 'Dancer2::Plugin::DBIC';
requires 'Dancer2::Plugin::RootURIFor';
requires 'Dancer2::Template::Xslate';
requires 'Data::Pageset';
requires 'DateTime';
requires 'DateTime::Duration';
requires 'DateTime::Format::Pg';
requires 'Digest::SHA1';
requires 'Domain::PublicSuffix';
requires 'Email::MIME';
requires 'Email::Sender::Simple';
requires 'Email::Sender::Transport::SMTP::Persistent';
requires 'Email::Sender::Transport::Test';
requires 'Email::Simple';
requires 'Email::Valid';
requires 'File::Slurper';
requires 'Hash::Merge::Simple';
requires 'HTML::FormatText::WithLinks';
requires 'HTML::TreeBuilder::XPath';
requires 'HTTP::Tiny';
requires 'HTTP::Validate';
requires 'IO::Socket::SSL';
requires 'Import::Into';
requires 'JSON::MaybeXS';
requires 'MIME::Base64';
requires 'Moo';
requires 'Moo::Role';
requires 'MooX::Options';
requires 'Net::Graphite';
requires 'Plack::Middleware::ReverseProxy';
requires 'Plack::Middleware::Throttle::Lite';
requires 'Reply';
requires 'Starman';
requires 'String::Truncate';
requires 'Text::CSV_XS';
requires 'Text::Xslate';
requires 'Try::Tiny';
requires 'URI';
requires 'XSLoader', '0.24';
requires 'MIME::Base64';
requires 'Authen::SASL';

on test => sub {
    requires 'HTTP::Request::Common';
    requires 'Plack::Builder';
    requires 'Plack::Test';
    requires 'Test::MockTime';
    requires 'Test::More';
    requires 'aliased';
};
