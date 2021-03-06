#<<<
use utf8;

package OpenCloset::Schema::Result::Event;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::Event

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 TABLE: C<event>

=cut

__PACKAGE__->table("event");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 event_type_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 title

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 desc

  data_type: 'text'
  is_nullable: 1

=head2 sponsor

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 year

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

연도; 애매하면 0

=head2 nth

  data_type: 'integer'
  default_value: 1
  is_nullable: 1

회차; 회차와 연도로 그룹화; 2018년 2회차; 2019년 1회차
=head2 free_shipping

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 start_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1
  timezone: 'Asia/Seoul'

=head2 end_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1
  timezone: 'Asia/Seoul'

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
    "event_type_id",
    {
        data_type      => "integer",
        extra          => { unsigned => 1 },
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "name",
    { data_type => "varchar", is_nullable => 0, size => 32 },
    "title",
    { data_type => "varchar", is_nullable => 0, size => 128 },
    "desc",
    { data_type => "text", is_nullable => 1 },
    "sponsor",
    { data_type => "varchar", is_nullable => 1, size => 128 },
    "year",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "nth",
    { data_type => "integer", default_value => 1, is_nullable => 1 },
    "free_shipping",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "start_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
        timezone                  => "Asia/Seoul",
    },
    "end_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
        timezone                  => "Asia/Seoul",
    },
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

=head2 coupons

Type: has_many

Related object: L<OpenCloset::Schema::Result::Coupon>

=cut

__PACKAGE__->has_many(
    "coupons",
    "OpenCloset::Schema::Result::Coupon",
    { "foreign.event_id" => "self.id" },
    { cascade_copy       => 0, cascade_delete => 0 },
);

=head2 donation_forms

Type: has_many

Related object: L<OpenCloset::Schema::Result::DonationForm>

=cut

__PACKAGE__->has_many(
    "donation_forms", "OpenCloset::Schema::Result::DonationForm",
    { "foreign.event_id" => "self.id" }, { cascade_copy => 0, cascade_delete => 0 },
);

=head2 event_type

Type: belongs_to

Related object: L<OpenCloset::Schema::Result::EventType>

=cut

__PACKAGE__->belongs_to(
    "event_type",
    "OpenCloset::Schema::Result::EventType",
    { id => "event_type_id" },
    {
        is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "CASCADE",
        on_update     => "RESTRICT",
    },
);

#>>>


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2018-12-15 15:15:01
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4NfbK7VRPXjE7PRSTgssSw


# You can replace this text with custom code or comments, and it will be preserved on regeneration

# ABSTRACT: OpenCloset Database Schema Class

our $VERSION = '0.061';

1;
