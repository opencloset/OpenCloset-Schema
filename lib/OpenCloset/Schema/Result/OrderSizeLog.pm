#<<<
use utf8;

package OpenCloset::Schema::Result::OrderSizeLog;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::OrderSizeLog

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 TABLE: C<order_size_log>

=cut

__PACKAGE__->table("order_size_log");

=head1 ACCESSORS

=head2 order_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 clothes_code

  data_type: 'char'
  default_value: (empty string)
  is_nullable: 0
  size: 5

=head2 timestamp

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  inflate_datetime: 1
  is_nullable: 0

=head2 category

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 color

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 gender

  data_type: 'varchar'
  is_nullable: 1
  size: 6

male/female/unisex

=head2 neck

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 bust

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 waist

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 hip

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 topbelly

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 belly

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 arm

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 thigh

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 length

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 price

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "order_id",
    { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
    "user_id",
    { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
    "clothes_code",
    { data_type => "char", default_value => "", is_nullable => 0, size => 5 },
    "timestamp",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        inflate_datetime          => 1,
        is_nullable               => 0,
    },
    "category",
    { data_type => "varchar", is_nullable => 0, size => 32 },
    "color",
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "gender",
    { data_type => "varchar", is_nullable => 1, size => 6 },
    "neck",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "bust",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "waist",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "hip",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "topbelly",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "belly",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "arm",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "thigh",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "length",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "price",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
);

#>>>


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-02-24 16:23:33
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rIWkGG6lrNjAQ+idWSQEIg


# You can replace this text with custom code or comments, and it will be preserved on regeneration

# ABSTRACT: OpenCloset Database Schema Class

our $VERSION = '0.020';

1;
