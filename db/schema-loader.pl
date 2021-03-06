use strict;
use warnings;

use File::Which;
use IPC::Open2;

use OpenCloset::Config;

my $CONF = OpenCloset::Config::load;

{
    schema_class => "OpenCloset::Schema",
    connect_info => {
        dsn  => $CONF->{database}{dsn},
        user => $CONF->{database}{user},
        pass => $CONF->{database}{pass},
        %{ $CONF->{database}{opts} },
    },
    loader_options => {
        dump_directory            => 'lib',
        naming                    => { ALL => 'v8' },
        moniker_map               => {
            clothes         => 'Clothes',
            order_clothes   => 'OrderClothes',
            discard_clothes => 'DiscardClothes',
            repair_clothes  => 'RepairClothes',
            sms             => 'SMS',
        },
        rel_name_map => {
            repair_clothe  => 'repair_clothes',
            discard_clothe => 'discard_clothes',
        },
        inflect_singular          => {
            clothes => 'clothes',
            sms     => 'sms',
        },
        skip_load_external        => 1,
        relationships             => 1,
        col_collision_map         => 'column_%s',
        result_base_class         => 'OpenCloset::Schema::Base',
        result_components_map     => {
            User    => [qw/EncodedColumn/],
            Clothes => [qw/+OpenCloset::FilterColumn/],
        },
        overwrite_modifications   => 1,
        datetime_undef_if_invalid => 1,
        filter_generated_code     => sub {
            my ( $type, $class, $source ) = @_;

            my $tidyall = File::Which::which('tidyall');
            die "cannot find tidyall binary\n" unless $tidyall;

            my $path = $class;
            $path =~ s{::}{/}g;
            $path = "lib/$path.pm";

            my ( $stdout, $stdin );
            my $pid = open2( $stdout, $stdin, 'tidyall', '-p', $path );
            print $stdin $source;
            close $stdin;
            my $destination = do { local $/; <$stdout> };
            close $stdout;
            waitpid( $pid, 0 );

            return "#<<<\n$destination\n#>>>\n";
        },
        custom_column_info        => sub {
            my ( $table, $col_name, $col_info ) = @_;

            use experimental 'switch';

            given ($col_name) {
                when ('create_date') {
                    return +{
                        %$col_info,
                        dynamic_default_on_create => 'get_kst_timestamp',
                        timezone => $CONF->{timezone},
                    };
                }
                when ('update_date') {
                    return +{
                        %$col_info,
                        dynamic_default_on_create => 'get_kst_timestamp',
                        dynamic_default_on_update => 'get_kst_timestamp',
                        timezone => $CONF->{timezone},
                    };
                }
                when (/_date$/) {
                    return +{
                        %$col_info,
                        timezone => $CONF->{timezone},
                    };
                }
                when ('date') {
                    return +{
                        %$col_info,
                        timezone => $CONF->{timezone},
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
                        timezone => $CONF->{timezone},
                    };
                }
            }

            return;
        },
    },
}
