import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genotek/core/constants/strings.dart';
import 'package:genotek/core/services/logger.dart';
import 'package:genotek/features/price_list/domain/usecases/get_prices.dart';
import 'package:genotek/features/price_list/presentation/bloc/price_event.dart';
import 'package:genotek/features/price_list/presentation/bloc/price_state.dart';

class PriceBloc extends Bloc<PriceEvent, PriceState> {
  final GetPrices getPrices;

  PriceBloc({required this.getPrices}) : super(const PriceState.initial()) {
    on<LoadPrices>((event, emit) async {
      Logger.log(Strings.logLoad);
      emit(const PriceState.loading());
      try {
        final result = await getPrices();
        result.fold(
          (failure) {
            Logger.log('${Strings.logError}$failure');
            emit(const PriceState.error(Strings.error));
          },
          (prices) {
            Logger.log('${Strings.logLoaded}$prices');
            emit(PriceState.loaded(prices));
          },
        );
      } catch (e) {
        Logger.log('${Strings.logError}$e');
        emit(PriceState.error(Strings.error));
      }
    });
  }
}
