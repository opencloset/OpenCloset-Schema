#<<<
use utf8;

package OpenCloset::Schema::Result::OrderParcel;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::OrderParcel

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 TABLE: C<order_parcel>

=cut

__PACKAGE__->table("order_parcel");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 order_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 status_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 parcel_service

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 waybill

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 return_waybill

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 sms_bitmask

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

flag to show each sms sent or not

=head2 comment

  data_type: 'text'
  is_nullable: 1

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

=head2 sent_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  inflate_datetime: 1
  is_nullable: 1

??????

=head2 arrival_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  inflate_datetime: 1
  is_nullable: 1

??????

=head2 return_sent_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  inflate_datetime: 1
  is_nullable: 1

??????

=head2 return_arrival_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  inflate_datetime: 1
  is_nullable: 1

??????

=cut

__PACKAGE__->add_columns(
    "id",
    {
        data_type         => "integer",
        extra             => { unsigned => 1 },
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "order_id",
    {
        data_type      => "integer",
        extra          => { unsigned => 1 },
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "status_id",
    {
        data_type      => "integer",
        extra          => { unsigned => 1 },
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "parcel_service",
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "waybill",
    { data_type => "varchar", is_nullable => 1, size => 128 },
    "return_waybill",
    { data_type => "varchar", is_nullable => 1, size => 128 },
    "sms_bitmask",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "comment",
    { data_type => "text", is_nullable => 1 },
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
    "sent_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        inflate_datetime          => 1,
        is_nullable               => 1,
    },
    "arrival_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        inflate_datetime          => 1,
        is_nullable               => 1,
    },
    "return_sent_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        inflate_datetime          => 1,
        is_nullable               => 1,
    },
    "return_arrival_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        inflate_datetime          => 1,
        is_nullable               => 1,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<order_id>

=over 4

=item * L</order_id>

=back

=cut

__PACKAGE__->add_unique_constraint( "order_id", ["order_id"] );

=head1 RELATIONS

=head2 order

Type: belongs_to

Related object: L<OpenCloset::Schema::Result::Order>

=cut

__PACKAGE__->belongs_to(
    "order",
    "OpenCloset::Schema::Result::Order",
    { id            => "order_id" },
    { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);

=head2 status

Type: belongs_to

Related object: L<OpenCloset::Schema::Result::Status>

=cut

__PACKAGE__->belongs_to(
    "status",
    "OpenCloset::Schema::Result::Status",
    { id            => "status_id" },
    { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);

#>>>


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-09-21 14:13:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Fv5mcGzHbhm/8c0WyXQ1xA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
