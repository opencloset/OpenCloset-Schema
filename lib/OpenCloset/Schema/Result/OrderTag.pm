#<<<
use utf8;

package OpenCloset::Schema::Result::OrderTag;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::OrderTag

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 TABLE: C<order_tag>

=cut

__PACKAGE__->table("order_tag");

=head1 ACCESSORS

=head2 order_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 tag_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "order_id",
    {
        data_type      => "integer",
        extra          => { unsigned => 1 },
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "tag_id",
    {
        data_type      => "integer",
        extra          => { unsigned => 1 },
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</order_id>

=item * L</tag_id>

=back

=cut

__PACKAGE__->set_primary_key( "order_id", "tag_id" );

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

=head2 tag

Type: belongs_to

Related object: L<OpenCloset::Schema::Result::Tag>

=cut

__PACKAGE__->belongs_to(
    "tag",
    "OpenCloset::Schema::Result::Tag",
    { id            => "tag_id" },
    { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);

#>>>


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-04-13 04:09:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Xi0qRayF5mVpK2O6935TLw


# You can replace this text with custom code or comments, and it will be preserved on regeneration

# ABSTRACT: OpenCloset Database Schema Class

our $VERSION = '0.060';

1;

# COPYRIGHT

__END__
