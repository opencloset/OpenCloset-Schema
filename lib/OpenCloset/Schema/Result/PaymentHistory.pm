#<<<
use utf8;

package OpenCloset::Schema::Result::PaymentHistory;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::PaymentHistory

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 TABLE: C<payment_history>

=cut

__PACKAGE__->table("payment_history");

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

imp_uid

=head2 cid

  data_type: 'varchar'
  is_nullable: 1
  size: 32

merchant_uid

=head2 amount

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 status

  data_type: 'varchar'
  is_nullable: 1
  size: 32

paid|ready|cancelled|failed

=head2 vendor

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 pay_method

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 dump

  data_type: 'text'
  is_nullable: 1

=head2 create_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  inflate_datetime: 1
  is_nullable: 1
  set_on_create: 1

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
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "amount",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "status",
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "vendor",
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "pay_method",
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "dump",
    { data_type => "text", is_nullable => 1 },
    "create_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        inflate_datetime          => 1,
        is_nullable               => 1,
        set_on_create             => 1,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

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

#>>>


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2017-01-19 06:47:07
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:bKG0UgWOTSHMJIzefgD30Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration

# ABSTRACT: OpenCloset Database Schema Class

our $VERSION = '0.044';

1;

# COPYRIGHT

__END__
