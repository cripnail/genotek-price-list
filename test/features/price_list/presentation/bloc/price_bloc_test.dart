import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:genotek/core/error/failures.dart';
import 'package:genotek/core/constants/strings.dart';
import 'package:genotek/features/price_list/domain/usecases/get_prices.dart';
import 'package:genotek/features/price_list/presentation/bloc/price_bloc.dart';
import 'package:genotek/features/price_list/presentation/bloc/price_event.dart';
import 'package:genotek/features/price_list/presentation/bloc/price_state.dart';
import 'package:mocktail/mocktail.dart';

class MockGetPrices extends Mock implements GetPrices {}

void main() {
  late PriceBloc bloc;
  late MockGetPrices mockGetPrices;

  setUpAll(() {
    registerFallbackValue(ServerFailure());
  });

  setUp(() {
    mockGetPrices = MockGetPrices();
    bloc = PriceBloc(getPrices: mockGetPrices);
  });

  tearDown(() {
    bloc.close();
  });

  test('Начальное состояние должно быть Initial', () {
    expect(bloc.state, const PriceState.initial());
  });

  blocTest<PriceBloc, PriceState>(
    'LoadPrices должен отправить [Loading, Error] когда получение данных не удалось',
    build: () {
      when(() => mockGetPrices.call())
          .thenAnswer((_) async => Left(ServerFailure()));
      return bloc;
    },
    act: (bloc) => bloc.add(const PriceEvent.load()),
    expect: () => [
      const PriceState.loading(),
      PriceState.error(Strings.errorText),
    ],
  );
}
