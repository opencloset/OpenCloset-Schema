#<<<
use utf8;

package OpenCloset::Schema::Result::ClothesCode;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::ClothesCode

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 TABLE: C<clothes_code>

=cut

__PACKAGE__->table("clothes_code");

=head1 ACCESSORS

=head2 category

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 code

  data_type: 'char'
  is_nullable: 0
  size: 5

=cut

__PACKAGE__->add_columns(
    "category", { data_type => "varchar", is_nullable => 0, size => 32 },
    "code",     { data_type => "char",    is_nullable => 0, size => 5 },
);

=head1 PRIMARY KEY

=over 4

=item * L</category>

=back

=cut

__PACKAGE__->set_primary_key("category");

#>>>


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2016-04-04 17:40:04
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:FnqIesJN9BcqY6FUT5OK6w


# You can replace this text with custom code or comments, and it will be preserved on regeneration

our $VERSION = '0.056';

1;

# COPYRIGHT

__END__
