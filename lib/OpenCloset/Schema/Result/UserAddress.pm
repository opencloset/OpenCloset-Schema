#<<<
use utf8;

package OpenCloset::Schema::Result::UserAddress;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::UserAddress

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 TABLE: C<user_address>

=cut

__PACKAGE__->table("user_address");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 phone

  data_type: 'varchar'
  is_nullable: 0
  size: 16

=head2 address1

  data_type: 'varchar'
  is_nullable: 1
  size: 32

dbid

=head2 address2

  data_type: 'varchar'
  is_nullable: 1
  size: 256

?????

=head2 address3

  data_type: 'varchar'
  is_nullable: 1
  size: 256

????

=head2 address4

  data_type: 'varchar'
  is_nullable: 1
  size: 256

????

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
    "user_id",
    {
        data_type      => "integer",
        extra          => { unsigned => 1 },
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "name",
    { data_type => "varchar", is_nullable => 0, size => 32 },
    "phone",
    { data_type => "varchar", is_nullable => 0, size => 16 },
    "address1",
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "address2",
    { data_type => "varchar", is_nullable => 1, size => 256 },
    "address3",
    { data_type => "varchar", is_nullable => 1, size => 256 },
    "address4",
    { data_type => "varchar", is_nullable => 1, size => 256 },
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

=head1 RELATIONS

=head2 orders

Type: has_many

Related object: L<OpenCloset::Schema::Result::Order>

=cut

__PACKAGE__->has_many(
    "orders",
    "OpenCloset::Schema::Result::Order",
    { "foreign.user_address_id" => "self.id" },
    { cascade_copy              => 0, cascade_delete => 0 },
);

=head2 user

Type: belongs_to

Related object: L<OpenCloset::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
    "user",
    "OpenCloset::Schema::Result::User",
    { id            => "user_id" },
    { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);

#>>>


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2017-03-13 15:48:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:mBHlB7ezb+l/XtQw8Yac4w


# You can replace this text with custom code or comments, and it will be preserved on regeneration

# ABSTRACT: OpenCloset Database Schema Class

our $VERSION = '0.048';

1;

# COPYRIGHT

__END__
