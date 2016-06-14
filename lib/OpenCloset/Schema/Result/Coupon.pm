#<<<
use utf8;

package OpenCloset::Schema::Result::Coupon;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::Coupon

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 TABLE: C<coupon>

=cut

__PACKAGE__->table("coupon");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 code

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 type

  data_type: 'varchar'
  default_value: 'default'
  is_nullable: 1
  size: 32

default|suit

=head2 status

  data_type: 'varchar'
  is_nullable: 1
  size: 32

provided|used|discarded

=head2 desc

  data_type: 'text'
  is_nullable: 1

=head2 price

  data_type: 'integer'
  default_value: 0
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

=head2 expires_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  inflate_datetime: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "id",
    {
        data_type         => "integer",
        extra             => { unsigned => 1 },
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "code",
    { data_type => "varchar", is_nullable => 0, size => 32 },
    "type",
    {
        data_type     => "varchar",
        default_value => "default",
        is_nullable   => 1,
        size          => 32,
    },
    "status",
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "desc",
    { data_type => "text", is_nullable => 1 },
    "price",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
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
    "expires_date",
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

=head2 C<code>

=over 4

=item * L</code>

=back

=cut

__PACKAGE__->add_unique_constraint( "code", ["code"] );

=head1 RELATIONS

=head2 orders

Type: has_many

Related object: L<OpenCloset::Schema::Result::Order>

=cut

__PACKAGE__->has_many(
    "orders",
    "OpenCloset::Schema::Result::Order",
    { "foreign.coupon_id" => "self.id" },
    { cascade_copy        => 0, cascade_delete => 0 },
);

#>>>


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2016-03-11 17:32:55
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OMsO7mCFqrioC+Alg5RlpQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration

# ABSTRACT: OpenCloset Database Schema Class

our $VERSION = '0.037';

1;

# COPYRIGHT

__END__
