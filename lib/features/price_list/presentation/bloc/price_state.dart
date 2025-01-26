import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:genotek/features/price_list/domain/entities/price.dart';

part 'price_state.freezed.dart';

@freezed
class PriceState with _$PriceState {
  const factory PriceState.initial() = Initial;

  const factory PriceState.loading() = Loading;

  const factory PriceState.loaded(List<Price> prices) = Loaded;

  const factory PriceState.error(String message) = Error;
}
