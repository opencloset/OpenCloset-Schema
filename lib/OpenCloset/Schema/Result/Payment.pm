#<<<
use utf8;

package OpenCloset::Schema::Result::Payment;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::Payment

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 TABLE: C<payment>

=cut

__PACKAGE__->table("payment");

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

=head2 sid

  data_type: 'varchar'
  is_nullable: 1
  size: 32

server id: imp_uid

=head2 cid

  data_type: 'varchar'
  is_nullable: 1
  size: 128

client id: merchant_uid

=head2 amount

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 vendor

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 pay_method

  data_type: 'varchar'
  is_nullable: 1
  size: 32

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
    "order_id",
    {
        data_type      => "integer",
        extra          => { unsigned => 1 },
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "sid",
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "cid",
    { data_type => "varchar", is_nullable => 1, size => 128 },
    "amount",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "vendor",
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "pay_method",
    { data_type => "varchar", is_nullable => 1, size => 32 },
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

=head1 UNIQUE CONSTRAINTS

=head2 C<cid>

=over 4

=item * L</cid>

=back

=cut

__PACKAGE__->add_unique_constraint( "cid", ["cid"] );

=head2 C<sid>

=over 4

=item * L</sid>

=back

=cut

__PACKAGE__->add_unique_constraint( "sid", ["sid"] );

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

=head2 payment_logs

Type: has_many

Related object: L<OpenCloset::Schema::Result::PaymentLog>

=cut

__PACKAGE__->has_many(
    "payment_logs", "OpenCloset::Schema::Result::PaymentLog",
    { "foreign.payment_id" => "self.id" }, { cascade_copy => 0, cascade_delete => 0 },
);

#>>>


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2017-03-13 15:48:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:usTO+uJC5LRfW7wHgZJWyg


# You can replace this text with custom code or comments, and it will be preserved on regeneration

# ABSTRACT: OpenCloset Database Schema Class

our $VERSION = '0.054';

1;

# COPYRIGHT

__END__
