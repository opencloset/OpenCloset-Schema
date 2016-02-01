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

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 ever_sent

  data_type: 'integer'
  is_nullable: 1

0 is false, otherwise true

=head2 birth_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  inflate_datetime: 1
  is_nullable: 1

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
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "ever_sent",
    { data_type => "integer", is_nullable => 1 },
    "birth_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        inflate_datetime          => 1,
        is_nullable               => 1,
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


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2016-02-01 14:52:05
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pqVrXoL7C12ug+zQy8PZVw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
