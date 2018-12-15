#<<<
use utf8;

package OpenCloset::Schema::Result::EventType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::EventType

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 TABLE: C<event_type>

=cut

__PACKAGE__->table("event_type");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 type

  data_type: 'varchar'
  is_nullable: 0
  size: 128

START_TYPE(reserve or rental)|END_TYPE(reserve or rental)

=head2 domain

  data_type: 'varchar'
  is_nullable: 0
  size: 128

rental or donation or volunteer

=head2 desc

  data_type: 'text'
  is_nullable: 0

=head2 create_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  dynamic_default_on_create: 'get_kst_timestamp'
  is_nullable: 1
  timezone: 'Asia/Seoul'

=head2 update_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  dynamic_default_on_create: 'get_kst_timestamp'
  dynamic_default_on_update: 'get_kst_timestamp'
  is_nullable: 1
  timezone: 'Asia/Seoul'

=cut

__PACKAGE__->add_columns(
    "id",
    {
        data_type         => "integer",
        extra             => { unsigned => 1 },
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "type",
    { data_type => "varchar", is_nullable => 0, size => 128 },
    "domain",
    { data_type => "varchar", is_nullable => 0, size => 128 },
    "desc",
    { data_type => "text", is_nullable => 0 },
    "create_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        dynamic_default_on_create => "get_kst_timestamp",
        is_nullable               => 1,
        timezone                  => "Asia/Seoul",
    },
    "update_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        dynamic_default_on_create => "get_kst_timestamp",
        dynamic_default_on_update => "get_kst_timestamp",
        is_nullable               => 1,
        timezone                  => "Asia/Seoul",
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 events

Type: has_many

Related object: L<OpenCloset::Schema::Result::Event>

=cut

__PACKAGE__->has_many(
    "events",
    "OpenCloset::Schema::Result::Event",
    { "foreign.event_type_id" => "self.id" },
    { cascade_copy            => 0, cascade_delete => 0 },
);

#>>>


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2018-12-15 02:11:12
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8no/mAzN+NJ8M9xrl5corA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

our $VERSION = '0.060';

1;
