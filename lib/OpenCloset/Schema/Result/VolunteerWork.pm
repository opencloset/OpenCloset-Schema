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

=head2 activity

  data_type: 'text'
  is_nullable: 1

=head2 comment

  data_type: 'text'
  is_nullable: 1

=head2 done

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

0: false, 1: true

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
    "activity",
    { data_type => "text", is_nullable => 1 },
    "comment",
    { data_type => "text", is_nullable => 1 },
    "done",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
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


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-07-22 10:51:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rlwvQoSRM9DGk3LOYe3H2Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
