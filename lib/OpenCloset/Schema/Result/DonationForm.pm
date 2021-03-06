#<<<
use utf8;

package OpenCloset::Schema::Result::DonationForm;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::DonationForm

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 TABLE: C<donation_form>

=cut

__PACKAGE__->table("donation_form");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 donation_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 event_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 ever_donate

  data_type: 'integer'
  is_nullable: 1

0 is false, otherwise true

=head2 ever_use

  data_type: 'integer'
  is_nullable: 1

0 is false, otherwise true

=head2 birth_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1
  timezone: 'Asia/Seoul'

=head2 gender

  data_type: 'integer'
  is_nullable: 1

1: male, 2: female

=head2 phone

  data_type: 'char'
  is_nullable: 1
  size: 11

format: 010xxxxxxxx

=head2 email

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 address1

  data_type: 'text'
  is_nullable: 1

address

=head2 address2

  data_type: 'text'
  is_nullable: 1

jibeon address

=head2 address3

  data_type: 'text'
  is_nullable: 1

extra address

=head2 category

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 quantity

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 terms

  data_type: 'integer'
  is_nullable: 1

0 is false, otherwise true

=head2 talent_donation

  data_type: 'integer'
  is_nullable: 1

0 is false, otherwise true

=head2 talent

  data_type: 'text'
  is_nullable: 1

=head2 status

  data_type: 'varchar'
  is_nullable: 1
  size: 32

accepted | waiting | delivering | delivered | returning | returned | cancel

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
  dynamic_default_on_create: 'get_kst_timestamp'
  is_nullable: 1
  timezone: 'Asia/Seoul'

=head2 return_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
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
    "donation_id",
    {
        data_type      => "integer",
        extra          => { unsigned => 1 },
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "event_id",
    {
        data_type      => "integer",
        extra          => { unsigned => 1 },
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "name",
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "ever_donate",
    { data_type => "integer", is_nullable => 1 },
    "ever_use",
    { data_type => "integer", is_nullable => 1 },
    "birth_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
        timezone                  => "Asia/Seoul",
    },
    "gender",
    { data_type => "integer", is_nullable => 1 },
    "phone",
    { data_type => "char", is_nullable => 1, size => 11 },
    "email",
    { data_type => "varchar", is_nullable => 1, size => 128 },
    "address1",
    { data_type => "text", is_nullable => 1 },
    "address2",
    { data_type => "text", is_nullable => 1 },
    "address3",
    { data_type => "text", is_nullable => 1 },
    "category",
    { data_type => "varchar", is_nullable => 1, size => 128 },
    "quantity",
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "terms",
    { data_type => "integer", is_nullable => 1 },
    "talent_donation",
    { data_type => "integer", is_nullable => 1 },
    "talent",
    { data_type => "text", is_nullable => 1 },
    "status",
    { data_type => "varchar", is_nullable => 1, size => 32 },
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
        dynamic_default_on_create => "get_kst_timestamp",
        is_nullable               => 1,
        timezone                  => "Asia/Seoul",
    },
    "return_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
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

=head2 donation

Type: belongs_to

Related object: L<OpenCloset::Schema::Result::Donation>

=cut

__PACKAGE__->belongs_to(
    "donation",
    "OpenCloset::Schema::Result::Donation",
    { id => "donation_id" },
    {
        is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "CASCADE",
        on_update     => "RESTRICT",
    },
);

=head2 event

Type: belongs_to

Related object: L<OpenCloset::Schema::Result::Event>

=cut

__PACKAGE__->belongs_to(
    "event",
    "OpenCloset::Schema::Result::Event",
    { id => "event_id" },
    {
        is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "CASCADE",
        on_update     => "RESTRICT",
    },
);

#>>>


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2018-10-13 15:37:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:CfglbSL85HsRcDl4LSov5w


# You can replace this text with custom code or comments, and it will be preserved on regeneration

# ABSTRACT: OpenCloset Database Schema Class

our $VERSION = '0.061';

1;

# COPYRIGHT

__END__
