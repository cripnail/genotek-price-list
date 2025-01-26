import 'package:equatable/equatable.dart';
import 'package:genotek/features/price_list/domain/entities/price_status.dart';

class Price extends Equatable {
  final String id;
  final String name;
  final int price;
  final int startPrice;
  final String href;
  final PriceStatus status;

  const Price({
    required this.id,
    required this.name,
    required this.price,
    required this.startPrice,
    required this.href,
    required this.status,
  });

  @override
  List<Object> get props => [id, name, price, startPrice, href, status];
}
