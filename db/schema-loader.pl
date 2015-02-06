use v5.18;
use strict;
use warnings;

my $dsn  = $ENV{OPENCLOSET_DATABASE_DSN}  || "dbi:mysql:opencloset:127.0.0.1";
my $name = $ENV{OPENCLOSET_DATABASE_NAME} || 'opencloset';
my $user = $ENV{OPENCLOSET_DATABASE_USER} || 'opencloset';
my $pass = $ENV{OPENCLOSET_DATABASE_PASS} // 'opencloset';
my $db_opts = {
    quote_char        => q{`},
    mysql_enable_utf8 => 1,
    on_connect_do     => 'SET NAMES utf8',
    RaiseError        => 1,
    AutoCommit        => 1,
};

{
    schema_class => "OpenCloset::Schema",
    connect_info => {
        dsn  => $dsn,
        user => $user,
        pass => $pass,
        %{$db_opts},
    },
    loader_options => {
        dump_directory            => 'lib',
        naming                    => { ALL => 'v8' },
        moniker_map               => {
            clothes       => 'Clothes',
            order_clothes => 'OrderClothes',
            sms           => 'SMS',
        },
        inflect_singular          => {
            clothes => 'clothes',
            sms     => 'sms',
        },
        skip_load_external        => 1,
        relationships             => 1,
        col_collision_map         => 'column_%s',
        result_base_class         => 'OpenCloset::Schema::Base',
        overwrite_modifications   => 1,
        datetime_undef_if_invalid => 1,
        filter_generated_code     => sub { return "#<<<\n$_[2]\n#>>>"; },
        custom_column_info        => sub {
            my ( $table, $col_name, $col_info ) = @_;

            no warnings 'experimental';
            given ($col_name) {
                when ('create_date') {
                    return +{
                        %$col_info,
                        set_on_create    => 1,
                        inflate_datetime => 1,
                    };
                }
                when ('update_date') {
                    return +{
                        %$col_info,
                        set_on_create    => 1,
                        set_on_update    => 1,
                        inflate_datetime => 1,
                    };
                }
                when (/_date$/) {
                    return +{
                        %$col_info,
                        inflate_datetime => 1,
                    };
                }
                when ('date') {
                    return +{
                        %$col_info,
                        inflate_datetime => 1,
                    };
                }
                when ('password') {
                    return +{
                        %$col_info,
                        encode_column       => 1,
                        encode_class        => 'Digest',
                        encode_args         => { algorithm => 'SHA-1', format => 'hex', salt_length => 10 },
                        encode_check_method => 'check_password',
                    };
                }
                when ('timestamp') {
                    return +{
                        %$col_info,
                        inflate_datetime => 1,
                    };
                }
            }

            return;
        },
    },
}
