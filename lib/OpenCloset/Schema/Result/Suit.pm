#<<<
use utf8;

package OpenCloset::Schema::Result::Suit;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::Suit

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 TABLE: C<suit>

=cut

__PACKAGE__->table("suit");

=head1 ACCESSORS

=head2 code_top

  data_type: 'char'
  is_foreign_key: 1
  is_nullable: 0
  size: 5

=head2 code_bottom

  data_type: 'char'
  is_foreign_key: 1
  is_nullable: 0
  size: 5

=cut

__PACKAGE__->add_columns(
    "code_top",
    { data_type => "char", is_foreign_key => 1, is_nullable => 0, size => 5 },
    "code_bottom",
    { data_type => "char", is_foreign_key => 1, is_nullable => 0, size => 5 },
);

=head1 PRIMARY KEY

=over 4

=item * L</code_top>

=back

=cut

__PACKAGE__->set_primary_key("code_top");

=head1 UNIQUE CONSTRAINTS

=head2 C<code_bottom>

=over 4

=item * L</code_bottom>

=back

=cut

__PACKAGE__->add_unique_constraint( "code_bottom", ["code_bottom"] );

=head1 RELATIONS

=head2 code_bottom

Type: belongs_to

Related object: L<OpenCloset::Schema::Result::Clothes>

=cut

__PACKAGE__->belongs_to(
    "code_bottom",
    "OpenCloset::Schema::Result::Clothes",
    { code          => "code_bottom" },
    { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);

=head2 code_top

Type: belongs_to

Related object: L<OpenCloset::Schema::Result::Clothes>

=cut

__PACKAGE__->belongs_to(
    "code_top",
    "OpenCloset::Schema::Result::Clothes",
    { code          => "code_top" },
    { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);

#>>>


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2016-01-13 15:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:TFngSu+xGba/jnSCxdza1w


# You can replace this text with custom code or comments, and it will be preserved on regeneration

# ABSTRACT: OpenCloset Database Schema Class

our $VERSION = '0.040';

1;

# COPYRIGHT

__END__
