#<<<
use utf8;

package OpenCloset::Schema::Result::ClothesTag;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::ClothesTag

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 TABLE: C<clothes_tag>

=cut

__PACKAGE__->table("clothes_tag");

=head1 ACCESSORS

=head2 clothes_code

  data_type: 'char'
  is_foreign_key: 1
  is_nullable: 0
  size: 5

=head2 tag_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "clothes_code",
    { data_type => "char", is_foreign_key => 1, is_nullable => 0, size => 5 },
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

=item * L</clothes_code>

=item * L</tag_id>

=back

=cut

__PACKAGE__->set_primary_key( "clothes_code", "tag_id" );

=head1 RELATIONS

=head2 clothes

Type: belongs_to

Related object: L<OpenCloset::Schema::Result::Clothes>

=cut

__PACKAGE__->belongs_to(
    "clothes",
    "OpenCloset::Schema::Result::Clothes",
    { code          => "clothes_code" },
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


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-08-13 18:42:58
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:KBJNW8BS2r4s5DRs9H7RTQ

# You can replace this text with custom code or comments, and it will be preserved on regeneration

# ABSTRACT: OpenCloset Database Schema Class

our $VERSION = '0.015';

1;

# COPYRIGHT

__END__
