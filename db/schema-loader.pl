my $DB_NAME     = $ENV{OPENCLOSET_DB}       || 'opencloset';
my $DB_USERNAME = $ENV{OPENCLOSET_USERNAME} || 'root';
my $DB_PASSWORD = $ENV{OPENCLOSET_PASSWORD} || '';

{
    schema_class => "Opencloset::Schema",
    connect_info => {
        dsn               => "dbi:mysql:$DB_NAME:127.0.0.1",
        user              => $DB_USERNAME,
        pass              => $DB_PASSWORD,
        mysql_enable_utf8 => 1,
    },
    loader_options => {
        dump_directory            => 'lib',
        naming                    => { ALL => 'v8' },
        skip_load_external        => 1,
        relationships             => 1,
        col_collision_map         => 'column_%s',
        result_base_class         => 'Opencloset::Schema::Base',
        overwrite_modifications   => 1,
        datetime_undef_if_invalid => 1,
        custom_column_info        => sub {
            my ($table, $col_name, $col_info) = @_;
            if ($col_name eq 'create_date') {
                return {%{$col_info}, set_on_create => 1, inflate_datetime => 1};
            }
            elsif ($col_name eq 'visit_date') {
                return {%{$col_info}, set_on_create => 1, set_on_update => 1, inflate_datetime => 1};
            }
            elsif ($col_name =~ /_date$/) {
                return {%{$col_info}, inflate_datetime => 1};
            }
        }
    },
}
