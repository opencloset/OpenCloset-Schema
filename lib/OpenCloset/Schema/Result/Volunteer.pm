use utf8;

package OpenCloset::Schema::Result::Volunteer;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::Volunteer

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 TABLE: C<volunteer>

=cut

__PACKAGE__->table("volunteer");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 email

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 phone

  data_type: 'varchar'
  is_nullable: 1
  size: 16

regex: 01d{8,9}

=head2 address

  data_type: 'text'
  is_nullable: 1

=head2 birth_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  inflate_datetime: 1
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
    { data_type => "varchar", is_nullable => 0, size => 32 },
    "email",
    { data_type => "varchar", is_nullable => 1, size => 128 },
    "phone",
    { data_type => "varchar", is_nullable => 1, size => 16 },
    "address",
    { data_type => "text", is_nullable => 1 },
    "birth_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        inflate_datetime          => 1,
        is_nullable               => 1,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 volunteer_works

Type: has_many

Related object: L<OpenCloset::Schema::Result::VolunteerWork>

=cut

__PACKAGE__->has_many(
    "volunteer_works",
    "OpenCloset::Schema::Result::VolunteerWork",
    { "foreign.volunteer_id" => "self.id" },
    { cascade_copy           => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-07-22 10:51:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:FTIMFFk7O0xn7N4i3WRD2A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
