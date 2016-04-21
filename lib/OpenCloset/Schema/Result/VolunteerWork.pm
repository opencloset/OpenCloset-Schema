#<<<
use utf8;

package OpenCloset::Schema::Result::VolunteerWork;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::VolunteerWork

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 TABLE: C<volunteer_work>

=cut

__PACKAGE__->table("volunteer_work");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 volunteer_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 activity_from_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  inflate_datetime: 1
  is_nullable: 0

=head2 activity_to_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  inflate_datetime: 1
  is_nullable: 0

=head2 period

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 reason

  data_type: 'text'
  is_nullable: 1

=head2 path

  data_type: 'text'
  is_nullable: 1

=head2 job

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 activity

  data_type: 'text'
  is_nullable: 1

=head2 comment

  data_type: 'text'
  is_nullable: 1

=head2 status

  data_type: 'varchar'
  default_value: 'reported'
  is_nullable: 1
  size: 32

reported | approved | done | canceled

=head2 authcode

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 need_1365

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 done_1365

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 talent

  data_type: 'text'
  is_nullable: 1

=head2 event_id

  data_type: 'varchar'
  is_nullable: 1
  size: 32

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
    "volunteer_id",
    {
        data_type      => "integer",
        extra          => { unsigned => 1 },
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "activity_from_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        inflate_datetime          => 1,
        is_nullable               => 0,
    },
    "activity_to_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        inflate_datetime          => 1,
        is_nullable               => 0,
    },
    "period",
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "reason",
    { data_type => "text", is_nullable => 1 },
    "path",
    { data_type => "text", is_nullable => 1 },
    "job",
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "activity",
    { data_type => "text", is_nullable => 1 },
    "comment",
    { data_type => "text", is_nullable => 1 },
    "status",
    {
        data_type     => "varchar",
        default_value => "reported",
        is_nullable   => 1,
        size          => 32,
    },
    "authcode",
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "need_1365",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "done_1365",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "talent",
    { data_type => "text", is_nullable => 1 },
    "event_id",
    { data_type => "varchar", is_nullable => 1, size => 32 },
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

=head2 volunteer

Type: belongs_to

Related object: L<OpenCloset::Schema::Result::Volunteer>

=cut

__PACKAGE__->belongs_to(
    "volunteer",
    "OpenCloset::Schema::Result::Volunteer",
    { id            => "volunteer_id" },
    { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);

=head2 volunteer_guestbooks

Type: has_many

Related object: L<OpenCloset::Schema::Result::VolunteerGuestbook>

=cut

__PACKAGE__->has_many(
    "volunteer_guestbooks",
    "OpenCloset::Schema::Result::VolunteerGuestbook",
    { "foreign.volunteer_work_id" => "self.id" },
    { cascade_copy                => 0, cascade_delete => 0 },
);

#>>>


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-10-15 19:08:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:IkA6rktvExrRCcYIY+4FyA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

# ABSTRACT: OpenCloset Database Schema Class

our $VERSION = '0.030';

1;

# COPYRIGHT

__END__
