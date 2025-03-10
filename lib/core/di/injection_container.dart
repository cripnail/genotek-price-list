import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:genotek/core/constants/api.dart';
import 'package:genotek/features/price_list/data/datasources/price_remote_data_source.dart';
import 'package:genotek/features/price_list/data/datasources/price_remote_data_source_impl.dart';
import 'package:genotek/features/price_list/data/repositories/price_repository_impl.dart';
import 'package:genotek/features/price_list/domain/repositories/price_repository.dart';
import 'package:genotek/features/price_list/domain/usecases/get_prices.dart';
import 'package:genotek/features/price_list/presentation/bloc/price_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => PriceBloc(getPrices: sl()));
  sl.registerLazySingleton(() => GetPrices(sl()));
  sl.registerLazySingleton<PriceRepository>(
      () => PriceRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<PriceRemoteDataSource>(
      () => PriceRemoteDataSourceImpl(client: sl()));

  final dio = Dio()..options.baseUrl = Api.baseUrl;

  if (kDebugMode) {
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

  sl.registerLazySingleton(() => dio);
}
