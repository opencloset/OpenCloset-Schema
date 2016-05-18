#<<<
use utf8;

package OpenCloset::Schema::Result::DiscardClothes;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::DiscardClothes

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 TABLE: C<discard_clothes>

=cut

__PACKAGE__->table("discard_clothes");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 clothes_code

  data_type: 'char'
  is_foreign_key: 1
  is_nullable: 0
  size: 5

=head2 discard_to

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 comment

  data_type: 'text'
  is_nullable: 1

=head2 create_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  inflate_datetime: 1
  is_nullable: 1
  set_on_create: 1

=head2 update_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  inflate_datetime: 1
  is_nullable: 1
  set_on_create: 1
  set_on_update: 1

=cut

__PACKAGE__->add_columns(
    "id",
    {
        data_type         => "integer",
        extra             => { unsigned => 1 },
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "clothes_code",
    { data_type => "char", is_foreign_key => 1, is_nullable => 0, size => 5 },
    "discard_to",
    { data_type => "varchar", is_nullable => 1, size => 128 },
    "comment",
    { data_type => "text", is_nullable => 1 },
    "create_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        inflate_datetime          => 1,
        is_nullable               => 1,
        set_on_create             => 1,
    },
    "update_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        inflate_datetime          => 1,
        is_nullable               => 1,
        set_on_create             => 1,
        set_on_update             => 1,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<clothes_code>

=over 4

=item * L</clothes_code>

=back

=cut

__PACKAGE__->add_unique_constraint( "clothes_code", ["clothes_code"] );

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

#>>>


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-05-18 10:49:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:NE3WEhQBw++RSFP5sZdvSw


# You can replace this text with custom code or comments, and it will be preserved on regeneration

# ABSTRACT: OpenCloset Database Schema Class

our $VERSION = '0.035';

1;

# COPYRIGHT

__END__
