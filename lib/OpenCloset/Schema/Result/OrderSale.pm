#<<<
use utf8;

package OpenCloset::Schema::Result::OrderSale;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::OrderSale

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 TABLE: C<order_sale>

=cut

__PACKAGE__->table("order_sale");

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

=head2 sale_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
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
    "order_id",
    {
        data_type      => "integer",
        extra          => { unsigned => 1 },
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "sale_id",
    {
        data_type      => "integer",
        extra          => { unsigned => 1 },
        is_foreign_key => 1,
        is_nullable    => 0,
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

=head2 sale

Type: belongs_to

Related object: L<OpenCloset::Schema::Result::Sale>

=cut

__PACKAGE__->belongs_to(
    "sale",
    "OpenCloset::Schema::Result::Sale",
    { id            => "sale_id" },
    { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);

#>>>


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2017-03-13 15:48:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:uFY00FeVXz4fYcaPIe4fWg

# You can replace this text with custom code or comments, and it will be preserved on regeneration

# ABSTRACT: OpenCloset Database Schema Class

our $VERSION = '0.053';

1;

# COPYRIGHT

__END__
