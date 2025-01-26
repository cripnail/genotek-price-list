import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:genotek/core/constants/strings.dart';
import 'package:genotek/core/error/failures.dart';
import 'package:genotek/core/services/logger.dart';
import 'package:genotek/features/price_list/data/datasources/price_remote_data_source.dart';
import 'package:genotek/features/price_list/domain/entities/price.dart';
import 'package:genotek/features/price_list/domain/repositories/price_repository.dart';

class PriceRepositoryImpl implements PriceRepository {
  final PriceRemoteDataSource remoteDataSource;

  PriceRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Price>>> getPrices() async {
    try {
      final priceModels = await remoteDataSource.getPrices();
      Logger.log('${Strings.logLoaded}$priceModels');
      return Right(priceModels.map((model) => model.toDomain()).toList());
    } on SocketException {
      Logger.log(Strings.debugNetworkError);
      return Left(NetworkFailure());
    } catch (e) {
      Logger.log('${Strings.debugRepositoryError}$e');
      return Left(ServerFailure());
    }
  }
}
