#<<<
use utf8;

package OpenCloset::Schema::Result::SMS;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::SMS

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 TABLE: C<sms>

=cut

__PACKAGE__->table("sms");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 from

  data_type: 'varchar'
  is_nullable: 0
  size: 12

=head2 to

  data_type: 'varchar'
  is_nullable: 0
  size: 12

=head2 text

  data_type: 'text'
  is_nullable: 0

=head2 ret

  data_type: 'integer'
  is_nullable: 1

=head2 status

  data_type: 'varchar'
  default_value: 'pending'
  is_nullable: 1
  size: 7

=head2 method

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 detail

  data_type: 'text'
  is_nullable: 1

=head2 sent_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  inflate_datetime: 1
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
    "from",
    { data_type => "varchar", is_nullable => 0, size => 12 },
    "to",
    { data_type => "varchar", is_nullable => 0, size => 12 },
    "text",
    { data_type => "text", is_nullable => 0 },
    "ret",
    { data_type => "integer", is_nullable => 1 },
    "status",
    {
        data_type     => "varchar",
        default_value => "pending",
        is_nullable   => 1,
        size          => 7,
    },
    "method",
    { data_type => "varchar", is_nullable => 1, size => 128 },
    "detail",
    { data_type => "text", is_nullable => 1 },
    "sent_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        inflate_datetime          => 1,
        is_nullable               => 1,
    },
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

#>>>


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-08-13 18:43:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:qxKvVGIimPd2miAOOU8gWQ

# You can replace this text with custom code or comments, and it will be preserved on regeneration

# ABSTRACT: OpenCloset Database Schema Class

our $VERSION = '0.036';

1;

# COPYRIGHT

__END__
