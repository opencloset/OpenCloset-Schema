#<<<
use utf8;

package OpenCloset::Schema::Result::OrderAgent;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::OrderAgent

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 TABLE: C<order_agent>

=cut

__PACKAGE__->table("order_agent");

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

=head2 label

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 gender

  data_type: 'varchar'
  is_nullable: 1
  size: 6

male/female

=head2 pre_category

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 height

  data_type: 'integer'
  is_nullable: 1

=head2 weight

  data_type: 'integer'
  is_nullable: 1

=head2 neck

  data_type: 'integer'
  is_nullable: 1

=head2 bust

  data_type: 'integer'
  is_nullable: 1

=head2 waist

  data_type: 'integer'
  is_nullable: 1

=head2 hip

  data_type: 'integer'
  is_nullable: 1

=head2 topbelly

  data_type: 'integer'
  is_nullable: 1

=head2 belly

  data_type: 'integer'
  is_nullable: 1

=head2 thigh

  data_type: 'integer'
  is_nullable: 1

=head2 arm

  data_type: 'integer'
  is_nullable: 1

=head2 leg

  data_type: 'integer'
  is_nullable: 1

=head2 knee

  data_type: 'integer'
  is_nullable: 1

=head2 foot

  data_type: 'integer'
  is_nullable: 1

=head2 pants

  data_type: 'integer'
  is_nullable: 1

=head2 skirt

  data_type: 'integer'
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
    "order_id",
    {
        data_type      => "integer",
        extra          => { unsigned => 1 },
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "label",
    { data_type => "varchar", is_nullable => 1, size => 128 },
    "gender",
    { data_type => "varchar", is_nullable => 1, size => 6 },
    "pre_category",
    { data_type => "varchar", is_nullable => 1, size => 128 },
    "height",
    { data_type => "integer", is_nullable => 1 },
    "weight",
    { data_type => "integer", is_nullable => 1 },
    "neck",
    { data_type => "integer", is_nullable => 1 },
    "bust",
    { data_type => "integer", is_nullable => 1 },
    "waist",
    { data_type => "integer", is_nullable => 1 },
    "hip",
    { data_type => "integer", is_nullable => 1 },
    "topbelly",
    { data_type => "integer", is_nullable => 1 },
    "belly",
    { data_type => "integer", is_nullable => 1 },
    "thigh",
    { data_type => "integer", is_nullable => 1 },
    "arm",
    { data_type => "integer", is_nullable => 1 },
    "leg",
    { data_type => "integer", is_nullable => 1 },
    "knee",
    { data_type => "integer", is_nullable => 1 },
    "foot",
    { data_type => "integer", is_nullable => 1 },
    "pants",
    { data_type => "integer", is_nullable => 1 },
    "skirt",
    { data_type => "integer", is_nullable => 1 },
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


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2017-08-07 14:56:42
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:tZseomQCSPvoyjVxa5tToQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration


# ABSTRACT: OpenCloset Database Schema Class

our $VERSION = '0.056';

1;

# COPYRIGHT

__END__
