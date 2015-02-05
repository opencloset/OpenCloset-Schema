use utf8;
package OpenCloset::Schema::Result::Order;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

OpenCloset::Schema::Result::Order

=cut

use strict;
use warnings;

=head1 BASE CLASS: L<OpenCloset::Schema::Base>

=cut

use base 'OpenCloset::Schema::Base';

=head1 TABLE: C<order>

=cut

__PACKAGE__->table("order");

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

=head2 status_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 staff_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 parent_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 booking_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 additional_day

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 1

=head2 rental_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  inflate_datetime: 1
  is_nullable: 1

=head2 target_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  inflate_datetime: 1
  is_nullable: 1

=head2 user_target_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  inflate_datetime: 1
  is_nullable: 1

=head2 return_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  inflate_datetime: 1
  is_nullable: 1

=head2 return_method

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 price_pay_with

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 late_fee_pay_with

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 compensation_pay_with

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 desc

  data_type: 'text'
  is_nullable: 1

=head2 purpose

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 purpose2

  data_type: 'text'
  is_nullable: 1

=head2 pre_category

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 pre_color

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 height

  data_type: 'integer'
  is_nullable: 1

=head2 weight

  data_type: 'integer'
  is_nullable: 1

=head2 bust

  data_type: 'integer'
  is_nullable: 1

=head2 waist

  data_type: 'integer'
  is_nullable: 1

=head2 hip

  data_type: 'integer'
  is_nullable: 1

=head2 belly

  data_type: 'integer'
  is_nullable: 1

=head2 thigh

  data_type: 'integer'
  is_nullable: 1

=head2 arm

  data_type: 'integer'
  is_nullable: 1

=head2 leg

  data_type: 'integer'
  is_nullable: 1

=head2 knee

  data_type: 'integer'
  is_nullable: 1

=head2 foot

  data_type: 'integer'
  is_nullable: 1

=head2 bestfit

  data_type: 'tinyint'
  default_value: 0
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
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "user_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "status_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "staff_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "parent_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "booking_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "additional_day",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 1,
  },
  "rental_date",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    inflate_datetime => 1,
    is_nullable => 1,
  },
  "target_date",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    inflate_datetime => 1,
    is_nullable => 1,
  },
  "user_target_date",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    inflate_datetime => 1,
    is_nullable => 1,
  },
  "return_date",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    inflate_datetime => 1,
    is_nullable => 1,
  },
  "return_method",
  { data_type => "varchar", is_nullable => 1, size => 32 },
  "price_pay_with",
  { data_type => "varchar", is_nullable => 1, size => 32 },
  "late_fee_pay_with",
  { data_type => "varchar", is_nullable => 1, size => 32 },
  "compensation_pay_with",
  { data_type => "varchar", is_nullable => 1, size => 32 },
  "desc",
  { data_type => "text", is_nullable => 1 },
  "purpose",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "purpose2",
  { data_type => "text", is_nullable => 1 },
  "pre_category",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "pre_color",
  { data_type => "varchar", is_nullable => 1, size => 32 },
  "height",
  { data_type => "integer", is_nullable => 1 },
  "weight",
  { data_type => "integer", is_nullable => 1 },
  "bust",
  { data_type => "integer", is_nullable => 1 },
  "waist",
  { data_type => "integer", is_nullable => 1 },
  "hip",
  { data_type => "integer", is_nullable => 1 },
  "belly",
  { data_type => "integer", is_nullable => 1 },
  "thigh",
  { data_type => "integer", is_nullable => 1 },
  "arm",
  { data_type => "integer", is_nullable => 1 },
  "leg",
  { data_type => "integer", is_nullable => 1 },
  "knee",
  { data_type => "integer", is_nullable => 1 },
  "foot",
  { data_type => "integer", is_nullable => 1 },
  "bestfit",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "create_date",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    inflate_datetime => 1,
    is_nullable => 1,
    set_on_create => 1,
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

=head1 RELATIONS

=head2 booking

Type: belongs_to

Related object: L<OpenCloset::Schema::Result::Booking>

=cut

__PACKAGE__->belongs_to(
  "booking",
  "OpenCloset::Schema::Result::Booking",
  { id => "booking_id" },
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
  { "foreign.order_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 order_status_logs

Type: has_many

Related object: L<OpenCloset::Schema::Result::OrderStatusLog>

=cut

__PACKAGE__->has_many(
  "order_status_logs",
  "OpenCloset::Schema::Result::OrderStatusLog",
  { "foreign.order_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 orders

Type: has_many

Related object: L<OpenCloset::Schema::Result::Order>

=cut

__PACKAGE__->has_many(
  "orders",
  "OpenCloset::Schema::Result::Order",
  { "foreign.parent_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 parent

Type: belongs_to

Related object: L<OpenCloset::Schema::Result::Order>

=cut

__PACKAGE__->belongs_to(
  "parent",
  "OpenCloset::Schema::Result::Order",
  { id => "parent_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "RESTRICT",
  },
);

=head2 staff

Type: belongs_to

Related object: L<OpenCloset::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "staff",
  "OpenCloset::Schema::Result::User",
  { id => "staff_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "RESTRICT",
  },
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

=head2 user

Type: belongs_to

Related object: L<OpenCloset::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "OpenCloset::Schema::Result::User",
  { id => "user_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-01-29 17:52:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:H8brJbcz8szH2rAfDCfZFQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration

# ABSTRACT: OpenCloset Database Schema Class

our $VERSION = '0.004';

=head2 clothes

Type: many_to_many

Composing rels: L</order_details> -> clothes

=cut

__PACKAGE__->many_to_many("clothes", "order_details", "clothes");

#
# Additional Methods
#

use List::Util qw/reduce/;

=method tracking_logs

주문서의 상태가 변경된 시점과, 변경전까지의 경과시간을 돌려줍니다.
결과는 시간의 순서에 따라, 상태명(status), 시점(timestamp) 그리고 경과시간(delta)
을 해쉬에 담은 배열이며 시점은 L<DateTime>, 경과시간은 L<DateTime::Duration> 객체입니다.
만약 주문의 마지막 시점인 경우 경과시간은 undef 입니다.

=cut

sub tracking_logs {
    my $self = shift;

    my @status_log =
      $self->order_status_logs( {}, { order_by => { -asc => 'timestamp' } } );

    my @log;
    for ( my $i = 0; $i < @status_log; $i++ ) {
        my ( $x, $y ) = @status_log[ $i, $i + 1 ];
        my $delta =
          $y ? $y->timestamp->subtract_datetime( $x->timestamp ) : undef;

        push @log,
          {
            status    => $x->status->name,
            timestamp => $x->timestamp,
            delta     => $delta
          };
    }

    return @log;
}

=method tracking_nomalize

주문서의 상태변화에 따른 경과시간을 정규화 합니다.
상태의 이름을 좀 더 분석하기 용이한 형태로 변환한 뒤
같은 상태의 경과시간은 합산합니다. 상태변화의 경과시점이
합산되면, 더 이상 특정 시점과는 무관하기 때문에 결과는
각각의 상태명을 키(key)로 하고 합산된 L<DateTime::Duration>을
값으로 하는 해쉬입니다.

상태명은 다음과 같이 변환되었습니다.

=for :list

* 방문     => 대기
* 탈의XX   => 탈의
* 대여중   => 대여
* 결제대기 => 결제
* 방문예약 => 예약

=cut

sub tracking_normalize {
    my $self = shift;
    my %h;

    for my $log ( $self->tracking_logs() ) {
        use experimental qw( smartmatch );

        my $status;
        given ( $log->{status} ) {
            when ('방문')      { $status = '대기'; }
            when (/^탈의\d+$/) { $status = '탈의'; }
            when ('대여중')    { $status = '대여'; }
            when ('결제대기')  { $status = '결제'; }
            when ('방문예약')  { $status = '예약'; }
            default            { $status = $log->{status}; }
        }

        push @{ $h{$status} }, $log->{delta} if $log->{delta};
    }

    return map {
        $_ => reduce {
            # DateTime::Duration은 base가 되는 시점없이는 초와 초를 분으로
            # 변환하지 않기때문에 특정시점을 기준으로 계산해야 합니다.
            my $dta = DateTime->now;
            my $dtb = $dta->clone()->add( $a + $b );
            $dtb - $dta
        }
        @{ $h{$_} }
    } keys %h;
}


1;

# COPYRIGHT

__END__
