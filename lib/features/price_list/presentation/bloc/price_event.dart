import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_event.freezed.dart';

@freezed
class PriceEvent with _$PriceEvent {
  const factory PriceEvent.load() = LoadPrices;
}