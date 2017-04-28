#<<<
use utf8;

package OpenCloset::Schema::Result::Visitor;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::Visitor

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 TABLE: C<visitor>

=cut

__PACKAGE__->table("visitor");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 date

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0
  timezone: 'Asia/Seoul'

=head2 online

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

null and 0 are false, otherwise true

=head2 reserved

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 reserved_male

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 reserved_female

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 visited

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 visited_male

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 visited_female

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 visited_age_10

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 visited_age_20

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 visited_age_30

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 visited_rate_30

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 visited_rate_30_sum

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 visited_rate_30_discount

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 unvisited

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 unvisited_male

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 unvisited_female

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 unvisited_age_10

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 unvisited_age_20

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 unvisited_age_30

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 rented

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 rented_male

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 rented_female

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 bestfit

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 bestfit_male

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 bestfit_female

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 event

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 create_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  dynamic_default_on_create: 'get_kst_timestamp'
  is_nullable: 1
  timezone: 'Asia/Seoul'

=head2 update_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  dynamic_default_on_create: 'get_kst_timestamp'
  dynamic_default_on_update: 'get_kst_timestamp'
  is_nullable: 1
  timezone: 'Asia/Seoul'

=cut

__PACKAGE__->add_columns(
    "id",
    {
        data_type         => "integer",
        extra             => { unsigned => 1 },
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "date",
    {
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
        timezone                  => "Asia/Seoul",
    },
    "online",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "reserved",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "reserved_male",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "reserved_female",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "visited",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "visited_male",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "visited_female",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "visited_age_10",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "visited_age_20",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "visited_age_30",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "visited_rate_30",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "visited_rate_30_sum",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "visited_rate_30_discount",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "unvisited",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "unvisited_male",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "unvisited_female",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "unvisited_age_10",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "unvisited_age_20",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "unvisited_age_30",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "rented",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "rented_male",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "rented_female",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "bestfit",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "bestfit_male",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "bestfit_female",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "event",
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "create_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        dynamic_default_on_create => "get_kst_timestamp",
        is_nullable               => 1,
        timezone                  => "Asia/Seoul",
    },
    "update_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        dynamic_default_on_create => "get_kst_timestamp",
        dynamic_default_on_update => "get_kst_timestamp",
        is_nullable               => 1,
        timezone                  => "Asia/Seoul",
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

#>>>


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2017-04-27 17:10:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zXzxe1FkbmzvKi5iDrsiwA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

# ABSTRACT: OpenCloset Database Schema Class

our $VERSION = '0.052';

1;

# COPYRIGHT

__END__
