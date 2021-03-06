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

=head2 event_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

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

=head2 extra

  data_type: 'text'
  is_nullable: 1

=head2 price

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 free_shipping

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

null and 0 are false, otherwise true

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

=head2 expires_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
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
    "event_id",
    {
        data_type      => "integer",
        extra          => { unsigned => 1 },
        is_foreign_key => 1,
        is_nullable    => 1,
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
    "extra",
    { data_type => "text", is_nullable => 1 },
    "price",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "free_shipping",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
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
    "expires_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
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

=head1 UNIQUE CONSTRAINTS

=head2 C<code>

=over 4

=item * L</code>

=back

=cut

__PACKAGE__->add_unique_constraint( "code", ["code"] );

=head1 RELATIONS

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


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2018-12-15 11:25:55
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:518I+09jzv3Jfp6cySK+wg


# You can replace this text with custom code or comments, and it will be preserved on regeneration

# ABSTRACT: OpenCloset Database Schema Class

our $VERSION = '0.061';

1;

# COPYRIGHT

__END__
