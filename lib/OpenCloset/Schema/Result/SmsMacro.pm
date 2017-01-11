#<<<
use utf8;

package OpenCloset::Schema::Result::SmsMacro;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::SmsMacro

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 TABLE: C<sms_macro>

=cut

__PACKAGE__->table("sms_macro");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 from

  data_type: 'varchar'
  is_nullable: 0
  size: 12

=head2 text

  data_type: 'text'
  is_nullable: 1

=head2 enabled

  data_type: 'integer'
  default_value: 1
  is_nullable: 1

0 is disabled

=head2 create_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  inflate_datetime: 1
  is_nullable: 1
  set_on_create: 1

=head2 update_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  inflate_datetime: 1
  is_nullable: 1
  set_on_create: 1
  set_on_update: 1

=cut

__PACKAGE__->add_columns(
    "id",
    {
        data_type         => "integer",
        extra             => { unsigned => 1 },
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "name",
    { data_type => "varchar", is_nullable => 0, size => 32 },
    "from",
    { data_type => "varchar", is_nullable => 0, size => 12 },
    "text",
    { data_type => "text", is_nullable => 1 },
    "enabled",
    { data_type => "integer", default_value => 1, is_nullable => 1 },
    "create_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        inflate_datetime          => 1,
        is_nullable               => 1,
        set_on_create             => 1,
    },
    "update_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        inflate_datetime          => 1,
        is_nullable               => 1,
        set_on_create             => 1,
        set_on_update             => 1,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

#>>>


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-11-17 15:44:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lzm5faT0o7RfmxHrdJ1OXA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

# ABSTRACT: OpenCloset Database Schema Class

our $VERSION = '0.043';

1;

# COPYRIGHT

__END__
