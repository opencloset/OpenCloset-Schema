#<<<
use utf8;

package OpenCloset::Schema::Result::RepairClothes;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::RepairClothes

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 TABLE: C<repair_clothes>

=cut

__PACKAGE__->table("repair_clothes");

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

=head2 alteration_at

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 cost

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 done

  data_type: 'integer'
  is_nullable: 1

1: ????, 2: ????

=head2 comment

  data_type: 'text'
  is_nullable: 1

=head2 assign_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1
  timezone: 'Asia/Seoul'

?????

=head2 pickup_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1
  timezone: 'Asia/Seoul'

???

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
    "clothes_code",
    { data_type => "char", is_foreign_key => 1, is_nullable => 0, size => 5 },
    "alteration_at",
    { data_type => "varchar", is_nullable => 1, size => 128 },
    "cost",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "done",
    { data_type => "integer", is_nullable => 1 },
    "comment",
    { data_type => "text", is_nullable => 1 },
    "assign_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
        timezone                  => "Asia/Seoul",
    },
    "pickup_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
        timezone                  => "Asia/Seoul",
    },
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


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2017-03-13 15:48:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:oNsbZ2kFWZuU0BrvteiC9Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration

our $VERSION = '0.053';

1;

# COPYRIGHT

1;
