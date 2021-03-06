#<<<
use utf8;

package OpenCloset::Schema::Result::Tag;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::Tag

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 TABLE: C<tag>

=cut

__PACKAGE__->table("tag");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'char'
  is_nullable: 0
  size: 128

=head2 label

  data_type: 'char'
  is_nullable: 0
  size: 128

=head2 desc

  data_type: 'text'
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
    "name",
    { data_type => "char", is_nullable => 0, size => 128 },
    "label",
    { data_type => "char", is_nullable => 0, size => 128 },
    "desc",
    { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<name>

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint( "name", ["name"] );

=head1 RELATIONS

=head2 clothes_tags

Type: has_many

Related object: L<OpenCloset::Schema::Result::ClothesTag>

=cut

__PACKAGE__->has_many(
    "clothes_tags", "OpenCloset::Schema::Result::ClothesTag",
    { "foreign.tag_id" => "self.id" }, { cascade_copy => 0, cascade_delete => 0 },
);

=head2 order_tags

Type: has_many

Related object: L<OpenCloset::Schema::Result::OrderTag>

=cut

__PACKAGE__->has_many(
    "order_tags",
    "OpenCloset::Schema::Result::OrderTag",
    { "foreign.tag_id" => "self.id" },
    { cascade_copy     => 0, cascade_delete => 0 },
);

=head2 clothes

Type: many_to_many

Composing rels: L</clothes_tags> -> clothes

=cut

__PACKAGE__->many_to_many( "clothes", "clothes_tags", "clothes" );

=head2 orders

Type: many_to_many

Composing rels: L</order_tags> -> order

=cut

__PACKAGE__->many_to_many( "orders", "order_tags", "order" );

#>>>


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-04-13 04:10:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:JEsHCeiw3TbSQGqI814Qzg

# You can replace this text with custom code or comments, and it will be preserved on regeneration

# ABSTRACT: OpenCloset Database Schema Class

our $VERSION = '0.061';

1;

# COPYRIGHT

__END__
