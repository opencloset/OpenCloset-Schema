#<<<
use utf8;

package OpenCloset::Schema::Result::VolunteerGuestbook;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::VolunteerGuestbook

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 TABLE: C<volunteer_guestbook>

=cut

__PACKAGE__->table("volunteer_guestbook");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 volunteer_work_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 age_group

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 impression

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 activity_hour

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 activity

  data_type: 'text'
  is_nullable: 1

=head2 want_to_do

  data_type: 'text'
  is_nullable: 1

=head2 comment

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
    "volunteer_work_id",
    {
        data_type      => "integer",
        extra          => { unsigned => 1 },
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "name",
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "age_group",
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "impression",
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "activity_hour",
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "activity",
    { data_type => "text", is_nullable => 1 },
    "want_to_do",
    { data_type => "text", is_nullable => 1 },
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
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 volunteer_work

Type: belongs_to

Related object: L<OpenCloset::Schema::Result::VolunteerWork>

=cut

__PACKAGE__->belongs_to(
    "volunteer_work",
    "OpenCloset::Schema::Result::VolunteerWork",
    { id            => "volunteer_work_id" },
    { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);

#>>>


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 18:36:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:PmyUxxryFYPOAteRkiNKJQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration

# ABSTRACT: OpenCloset Database Schema Class

our $VERSION = '0.047';

1;

# COPYRIGHT

__END__
