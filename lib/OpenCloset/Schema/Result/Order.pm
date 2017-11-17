#<<<
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

=head2 coupon_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 user_address_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 online

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

0 is offline, otherwise online

=head2 additional_day

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 1

=head2 rental_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1
  timezone: 'Asia/Seoul'

=head2 wearon_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1
  timezone: 'Asia/Seoul'

=head2 target_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1
  timezone: 'Asia/Seoul'

=head2 user_target_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1
  timezone: 'Asia/Seoul'

=head2 return_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1
  timezone: 'Asia/Seoul'

=head2 return_method

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 return_memo

  data_type: 'text'
  is_nullable: 1

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

=head2 pass

  data_type: 'integer'
  is_nullable: 1

a flag represent get pass or not. null or 0 is false, otherwise true

=head2 desc

  data_type: 'text'
  is_nullable: 1

=head2 message

  data_type: 'text'
  is_nullable: 1

=head2 misc

  data_type: 'text'
  is_nullable: 1

=head2 shipping_misc

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

=head2 neck

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

=head2 topbelly

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

=head2 pants

  data_type: 'integer'
  is_nullable: 1

=head2 skirt

  data_type: 'integer'
  is_nullable: 1

=head2 bestfit

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 1

=head2 ignore

  data_type: 'integer'
  is_nullable: 1

null and 0 are false, otherwise true

=head2 ignore_sms

  data_type: 'integer'
  is_nullable: 1

null and 0 are false, otherwise true

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

=head2 does_wear

  data_type: 'integer'
  is_nullable: 1

null and 0 is false, otherwise true

=head2 agent

  data_type: 'integer'
  is_nullable: 1

null and 0 are false, otherwise true

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
    "status_id",
    {
        data_type      => "integer",
        extra          => { unsigned => 1 },
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "staff_id",
    {
        data_type      => "integer",
        extra          => { unsigned => 1 },
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "parent_id",
    {
        data_type      => "integer",
        extra          => { unsigned => 1 },
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "booking_id",
    {
        data_type      => "integer",
        extra          => { unsigned => 1 },
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "coupon_id",
    {
        data_type      => "integer",
        extra          => { unsigned => 1 },
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "user_address_id",
    {
        data_type      => "integer",
        extra          => { unsigned => 1 },
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "online",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
    "additional_day",
    {
        data_type     => "integer",
        default_value => 0,
        extra         => { unsigned => 1 },
        is_nullable   => 1,
    },
    "rental_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
        timezone                  => "Asia/Seoul",
    },
    "wearon_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
        timezone                  => "Asia/Seoul",
    },
    "target_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
        timezone                  => "Asia/Seoul",
    },
    "user_target_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
        timezone                  => "Asia/Seoul",
    },
    "return_date",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
        timezone                  => "Asia/Seoul",
    },
    "return_method",
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "return_memo",
    { data_type => "text", is_nullable => 1 },
    "price_pay_with",
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "late_fee_pay_with",
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "compensation_pay_with",
    { data_type => "varchar", is_nullable => 1, size => 32 },
    "pass",
    { data_type => "integer", is_nullable => 1 },
    "desc",
    { data_type => "text", is_nullable => 1 },
    "message",
    { data_type => "text", is_nullable => 1 },
    "misc",
    { data_type => "text", is_nullable => 1 },
    "shipping_misc",
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
    "neck",
    { data_type => "integer", is_nullable => 1 },
    "bust",
    { data_type => "integer", is_nullable => 1 },
    "waist",
    { data_type => "integer", is_nullable => 1 },
    "hip",
    { data_type => "integer", is_nullable => 1 },
    "topbelly",
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
    "pants",
    { data_type => "integer", is_nullable => 1 },
    "skirt",
    { data_type => "integer", is_nullable => 1 },
    "bestfit",
    { data_type => "tinyint", default_value => 0, is_nullable => 1 },
    "ignore",
    { data_type => "integer", is_nullable => 1 },
    "ignore_sms",
    { data_type => "integer", is_nullable => 1 },
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
    "does_wear",
    { data_type => "integer", is_nullable => 1 },
    "agent",
    { data_type => "integer", is_nullable => 1 },
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

=head2 coupon

Type: belongs_to

Related object: L<OpenCloset::Schema::Result::Coupon>

=cut

__PACKAGE__->belongs_to(
    "coupon",
    "OpenCloset::Schema::Result::Coupon",
    { id => "coupon_id" },
    {
        is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "CASCADE",
        on_update     => "RESTRICT",
    },
);

=head2 order_agents

Type: has_many

Related object: L<OpenCloset::Schema::Result::OrderAgent>

=cut

__PACKAGE__->has_many(
    "order_agents", "OpenCloset::Schema::Result::OrderAgent",
    { "foreign.order_id" => "self.id" }, { cascade_copy => 0, cascade_delete => 0 },
);

=head2 order_details

Type: has_many

Related object: L<OpenCloset::Schema::Result::OrderDetail>

=cut

__PACKAGE__->has_many(
    "order_details", "OpenCloset::Schema::Result::OrderDetail",
    { "foreign.order_id" => "self.id" }, { cascade_copy => 0, cascade_delete => 0 },
);

=head2 order_parcel

Type: might_have

Related object: L<OpenCloset::Schema::Result::OrderParcel>

=cut

__PACKAGE__->might_have(
    "order_parcel", "OpenCloset::Schema::Result::OrderParcel",
    { "foreign.order_id" => "self.id" }, { cascade_copy => 0, cascade_delete => 0 },
);

=head2 order_sales

Type: has_many

Related object: L<OpenCloset::Schema::Result::OrderSale>

=cut

__PACKAGE__->has_many(
    "order_sales", "OpenCloset::Schema::Result::OrderSale",
    { "foreign.order_id" => "self.id" }, { cascade_copy => 0, cascade_delete => 0 },
);

=head2 order_status_logs

Type: has_many

Related object: L<OpenCloset::Schema::Result::OrderStatusLog>

=cut

__PACKAGE__->has_many(
    "order_status_logs", "OpenCloset::Schema::Result::OrderStatusLog",
    { "foreign.order_id" => "self.id" }, { cascade_copy => 0, cascade_delete => 0 },
);

=head2 orders

Type: has_many

Related object: L<OpenCloset::Schema::Result::Order>

=cut

__PACKAGE__->has_many(
    "orders",
    "OpenCloset::Schema::Result::Order",
    { "foreign.parent_id" => "self.id" },
    { cascade_copy        => 0, cascade_delete => 0 },
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

=head2 payments

Type: has_many

Related object: L<OpenCloset::Schema::Result::Payment>

=cut

__PACKAGE__->has_many(
    "payments",
    "OpenCloset::Schema::Result::Payment",
    { "foreign.order_id" => "self.id" },
    { cascade_copy       => 0, cascade_delete => 0 },
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
    { id            => "user_id" },
    { is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT" },
);

=head2 user_address

Type: belongs_to

Related object: L<OpenCloset::Schema::Result::UserAddress>

=cut

__PACKAGE__->belongs_to(
    "user_address",
    "OpenCloset::Schema::Result::UserAddress",
    { id => "user_address_id" },
    {
        is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "CASCADE",
        on_update     => "RESTRICT",
    },
);

#>>>


# Created by DBIx::Class::Schema::Loader v0.07047 @ 2017-11-17 12:51:18
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kqis8OlHTxM2Zk7FKlLGVg

# You can replace this text with custom code or comments, and it will be preserved on regeneration

# ABSTRACT: OpenCloset Database Schema Class

our $VERSION = '0.056';

=head2 clothes

Type: many_to_many

Composing rels: L</order_details> -> clothes

=cut

__PACKAGE__->many_to_many( "clothes", "order_details", "clothes" );

#
# Additional Methods
#

sub _normalize_status_name {
    my ( $self, $name ) = @_;

    return unless $name;

    my $normalize = $name;
    {
        use experimental qw( switch );

        given ($name) {
            $normalize = '대기' when '방문';
            $normalize = '탈의' when /^탈의\d+$/;
            $normalize = '대여' when '대여중';
            $normalize = '결제' when '결제대기';
            $normalize = '예약' when '방문예약';
        }
    }

    return $normalize;
}

=method analyze_order_status_logs

주문서의 상태 로그를 분석해 각 단계별 로그 정보와
정규화한 각 단계별 소요 시간을 반환합니다.

    my $order = $schema->resultset('Order')->find(13);
    my %result = $order->analyze_order_status_logs;
    #
    # check each logs
    #
    for my $log ( @{ $result{logs} } ) {
        my $status           = $log->{status};           # status name
        my $normalize_status = $log->{normalize_status}; # normalize status name
        my $timestamp        = $log->{timestamp};        # DateTime object
        my $delta            = $log->{delta};            # seconds
                                                         # undef means last status
    }
    #
    # check elapsed time
    #
    for my $normalize_status ( keys %{ $result{elapsed_time} } ) {
        print "$normalize_status: $result{elapsed_time}{$normalize_status} sec\n";
    }

=cut

sub analyze_order_status_logs {
    my $self = shift;

    my @status_logs = $self->order_status_logs(
        {},
        {
            order_by => { -asc => 'timestamp' },
            prefetch => 'status',
        },
    );

    my @logs;
    my %elapsed_time;
    for ( my $i = 0; $i < @status_logs; $i++ ) {
        #
        # generate log
        #
        my $current = $status_logs[$i];

        my %log = (
            status           => $current->status->name,
            normalize_status => $self->_normalize_status_name( $current->status->name ),
            timestamp        => $current->timestamp,
            delta            => undef,
        );

        if ( ( $i + 1 ) < @status_logs ) {
            my $next = $status_logs[ $i + 1 ];
            $log{delta} = $next->timestamp->epoch - $current->timestamp->epoch;
        }
        push @logs, \%log;

        #
        # sum elapsed time for each normalized status
        #
        $elapsed_time{ $log{normalize_status} } = 0
            unless $elapsed_time{ $log{normalize_status} };
        $elapsed_time{ $log{normalize_status} } += $log{delta} if $log{delta};
    }

    my %result = (
        logs         => \@logs,
        elapsed_time => \%elapsed_time,
    );

    return %result;
}

1;

# COPYRIGHT

__END__
