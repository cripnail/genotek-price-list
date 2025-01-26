import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:genotek/features/price_list/domain/entities/price.dart';
import 'package:genotek/features/price_list/domain/entities/price_status.dart';

@JsonSerializable()
class PriceModel {
  final String name;
  final String href;
  final int price;
  final int startPrice;
  final dynamic bitrixId;
  final bool discountState;

  const PriceModel({
    required this.name,
    required this.href,
    required this.price,
    required this.startPrice,
    required this.bitrixId,
    required this.discountState,
  });

  factory PriceModel.fromJson(String href, Map<String, dynamic> json) =>
      PriceModel(
        name: json['name'] as String,
        href: href,
        price: json['price'] as int,
        startPrice: json['startPrice'] as int,
        bitrixId: json['bitrix_id'],
        discountState: json['discountState'] as bool? ?? false,
      );

  Price toDomain() => Price(
        id: bitrixId?.toString() ?? href,
        name: name,
        price: price,
        startPrice: startPrice,
        href: href,
        status: discountState ? PriceStatus.discount : PriceStatus.active,
      );
}
