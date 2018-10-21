#<<<
use utf8;

package OpenCloset::Schema::Result::Clothes;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::Clothes

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 COMPONENTS LOADED

=over 4

=item * L<OpenCloset::FilterColumn>

=back

=cut

__PACKAGE__->load_components("+OpenCloset::FilterColumn");

=head1 TABLE: C<clothes>

=cut

__PACKAGE__->table("clothes");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 donation_id

  data_type: 'integer'
  default_value: 1
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 status_id

  data_type: 'integer'
  default_value: 1
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 group_id

  data_type: 'integer'
  default_value: 1
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 code

  data_type: 'char'
  is_nullable: 0
  size: 5

=head2 neck

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 bust

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 waist

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 hip

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 topbelly

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 belly

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 arm

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 thigh

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 length

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 cuff

  data_type: 'decimal'
  default_value: 0.00
  is_nullable: 1
  size: [5,2]

=head2 color

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 gender

  data_type: 'varchar'
  is_nullable: 1
  size: 6

male/female/unisex

=head2 category

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 price

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=head2 comment

  data_type: 'text'
  is_nullable: 1

=head2 compatible_code

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=cut

__PACKAGE__->add_columns(
    "id",
    {
        data_type         => "integer",
        extra             => { unsigned => 1 },
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "donation_id",
    {
        data_type      => "integer",
        default_value  => 1,
        extra          => { unsigned => 1 },
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "status_id",
    {
        data_type      => "integer",
        default_value  => 1,
        extra          => { unsigned => 1 },
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "group_id",
    {
        data_type      => "integer",
        default_value  => 1,
        extra          => { unsigned => 1 },
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "code",
    { data_type => "char", is_nullable => 0, size => 5 },
    "neck",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "bust",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "waist",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "hip",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "topbelly",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "belly",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "arm",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "thigh",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "length",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "cuff",
    {
        data_type     => "decimal",
        default_value => "0.00",
        is_nullable   => 1,
        size          => [ 5, 2 ],
    },
    "color",
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "gender",
    { data_type => "varchar", is_nullable => 1, size => 6 },
    "category",
    { data_type => "varchar", is_nullable => 0, size => 32 },
    "price",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "comment",
    { data_type => "text", is_nullable => 1 },
    "compatible_code",
    { data_type => "varchar", is_nullable => 1, size => 32 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<code>

=over 4

=item * L</code>

=back

=cut

__PACKAGE__->add_unique_constraint( "code", ["code"] );

=head1 RELATIONS

=head2 clothes_tags

Type: has_many

Related object: L<OpenCloset::Schema::Result::ClothesTag>

=cut

__PACKAGE__->has_many(
    "clothes_tags",
    "OpenCloset::Schema::Result::ClothesTag",
    { "foreign.clothes_code" => "self.code" },
    { cascade_copy           => 0, cascade_delete => 0 },
);

=head2 discard_clothes

Type: might_have

Related object: L<OpenCloset::Schema::Result::DiscardClothes>

=cut

__PACKAGE__->might_have(
    "discard_clothes",
    "OpenCloset::Schema::Result::DiscardClothes",
    { "foreign.clothes_code" => "self.code" },
    { cascade_copy           => 0, cascade_delete => 0 },
);

=head2 donation

Type: belongs_to

Related object: L<OpenCloset::Schema::Result::Donation>

=cut

__PACKAGE__->belongs_to(
    "donation",
    "OpenCloset::Schema::Result::Donation",
    { id => "donation_id" },
    {
        is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "CASCADE",
        on_update     => "RESTRICT",
    },
);

=head2 group

Type: belongs_to

Related object: L<OpenCloset::Schema::Result::Group>

=cut

__PACKAGE__->belongs_to(
    "group",
    "OpenCloset::Schema::Result::Group",
    { id => "group_id" },
    {
        is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "CASCADE",
        on_update     => "RESTRICT",
    },
);

=head2 order_details

Type: has_many

Related object: L<OpenCloset::Schema::Result::OrderDetail>

=cut

__PACKAGE__->has_many(
    "order_details",
    "OpenCloset::Schema::Result::OrderDetail",
    { "foreign.clothes_code" => "self.code" },
    { cascade_copy           => 0, cascade_delete => 0 },
);

=head2 repair_clothes

Type: might_have

Related object: L<OpenCloset::Schema::Result::RepairClothes>

=cut

__PACKAGE__->might_have(
    "repair_clothes",
    "OpenCloset::Schema::Result::RepairClothes",
    { "foreign.clothes_code" => "self.code" },
    { cascade_copy           => 0, cascade_delete => 0 },
);

=head2 satisfactions

Type: has_many

Related object: L<OpenCloset::Schema::Result::Satisfaction>

=cut

__PACKAGE__->has_many(
    "satisfactions",
    "OpenCloset::Schema::Result::Satisfaction",
    { "foreign.clothes_code" => "self.code" },
    { cascade_copy           => 0, cascade_delete => 0 },
);

=head2 status

Type: belongs_to

Related object: L<OpenCloset::Schema::Result::Status>

=cut

__PACKAGE__->belongs_to(
    "status",
    "OpenCloset::Schema::Result::Status",
    { id => "status_id" },
    {
        is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "CASCADE",
        on_update     => "RESTRICT",
    },
);

=head2 suit_code_bottom

Type: might_have

Related object: L<OpenCloset::Schema::Result::Suit>

=cut

__PACKAGE__->might_have(
    "suit_code_bottom",
    "OpenCloset::Schema::Result::Suit",
    { "foreign.code_bottom" => "self.code" },
    { cascade_copy          => 0, cascade_delete => 0 },
);

=head2 suit_code_top

Type: might_have

Related object: L<OpenCloset::Schema::Result::Suit>

=cut

__PACKAGE__->might_have(
    "suit_code_top",
    "OpenCloset::Schema::Result::Suit",
    { "foreign.code_top" => "self.code" },
    { cascade_copy       => 0, cascade_delete => 0 },
);

=head2 tags

Type: many_to_many

Composing rels: L</clothes_tags> -> tag

=cut

__PACKAGE__->many_to_many( "tags", "clothes_tags", "tag" );

#>>>


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-05-18 10:49:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gX435LnPn5X8MYxCP4oAeA

# You can replace this text with custom code or comments, and it will be preserved on regeneration

# ABSTRACT: OpenCloset Database Schema Class

our $VERSION = '0.059';

=head2 orders

Type: many_to_many

Composing rels: L</order_details> -> order

=cut

__PACKAGE__->many_to_many( "orders", "order_details", "order" );

=method warehousing_date

의류의 입고일을 반환합니다. 인자로 받은 최소 의류 입고일 이전에
입고된 의류의 경우 최소 의류 입고일을 반환합니다.

=cut

sub warehousing_date {
    my ( $self, $time_zone, $min_warehousing_dt ) = @_;

    #
    # 입고일: 기증 행위가 생성된 날짜
    #
    my $warehousing_dt = $self->donation->create_date->clone;

    #
    # 기존 시점 이전에 입고된 의류의 경우
    # 입고일을 기준 시점으로 함
    #
    if ($min_warehousing_dt) {
        $warehousing_dt = $min_warehousing_dt if $warehousing_dt < $min_warehousing_dt;
    }

    $warehousing_dt->set_time_zone($time_zone) if $time_zone;

    return $warehousing_dt;
}

=method rentable_duration

의류의 입고일로부터 기준 날짜까지의 날 수를 반환합니다.
첫 번째 인자는 시간 계산시 기준 날짜 DateTime 객체입니다.
두 번째 인자는 최소 의류 입고일입니다.
의류의 입고 시점이 최소 의류 입고일보다 이전인 경우 최소 의류 입고일을
의류 입고일로 간주합니다. 입고일이 기준 날짜보다 이를 경우 음수를 반환합니다.

=cut

sub rentable_duration {
    my ( $self, $dest_dt, $min_warehousing_dt ) = @_;

    my $time_zone;
    if ( $dest_dt && $dest_dt->time_zone && $dest_dt->time_zone->name ) {
        $time_zone = $dest_dt->time_zone->name;
    }

    my $warehousing_dt = $self->warehousing_date( $time_zone, $min_warehousing_dt );
    return unless $warehousing_dt;

    my $delta = $warehousing_dt->delta_days($dest_dt)->in_units("days");

    #
    # 입고일이 오늘보다 앞설경우 음수를 반환합니다.
    #
    $delta = $delta * -1 if $warehousing_dt > $dest_dt;

    return $delta;
}

=method rented_duration

의류가 입고된 이후 대여된 날 수를 반환합니다. 현재시점에서 반납이 완료된 의류만을
대상으로하며, 반납 시점이 대여 시점보다 이른 주문서는 계산에 포함시키지 않습니다.

=cut

sub rented_duration {
    my ( $self, $time_zone ) = @_;

    my @order_details = $self->order_details(
        {
            'order.rental_date' => { '!=' => undef },
            'order.return_date' => { '!=' => undef }
        },
        {
            select   => [ 'order.rental_date', 'order.return_date' ],
            prefetch => 'order'
        },
    );

    my $sum = 0;
    for my $order_detail (@order_details) {
        my $rental_date = $order_detail->order->rental_date->clone;
        my $return_date = $order_detail->order->return_date->clone;

        if ($time_zone) {
            $rental_date->set_time_zone($time_zone);
            $return_date->set_time_zone($time_zone);
        }

        # 반납 시점이 대여 시점보다 이른 주문서는 누적하지 않음
        next unless $rental_date <= $return_date;

        # 당일 빌려서 당일 반납할 경우 대여된 날 수는 1일입니다.
        # 당일 빌려서 다음날 반납할 경우 대여된 날 수는 2일입니다.
        # 즉 0박 1일일 경우 1일, 1박 2일일 경우 2일인 것입니다.
        # 따라서 delta_days()값에 1을 더해야 열린옷장이 원하는 대여된 날 수 입니다.
        $sum += $return_date->delta_days($rental_date)->in_units('days') + 1;
    }

    return $sum;
}

=method rent_ratio

의류의 입고일로부터 기준 날짜까지의 날을 기준으로 대여가능일과 대여일의 비율을 돌려줍니다.
첫 번째 인자는 시간 계산시 기준 날짜 DateTime 객체입니다.
두 번째 인자는 최소 의류 입고일입니다.

=cut

sub rent_ratio {
    my ( $self, $dest_dt, $min_warehousing_dt ) = @_;

    my $rentable = $self->rentable_duration( $dest_dt, $min_warehousing_dt );
    return 0 unless $rentable;

    return $self->rented_duration / $rentable;
}

=method top

셋트의류일 경우에 상의에 대한 shortcut

=cut

sub top {
    my $self     = shift;
    my $category = $self->category;

    return $self if $category eq 'jacket';
    return unless "pants skirt" =~ m/\b$category\b/;

    my $suit = $self->suit_code_bottom;
    return unless $suit;
    return $suit->code_top;
}

=method bottom

셋트의류일 경우에 하의에 대한 shortcut

=cut

sub bottom {
    my $self     = shift;
    my $category = $self->category;

    return $self if "pants skirt" =~ m/\b$category\b/;
    return if $category ne 'jacket';

    my $suit = $self->suit_code_top;
    return unless $suit;
    return $suit->code_bottom;
}

1;

# COPYRIGHT

__END__
