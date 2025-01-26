import 'package:dartz/dartz.dart';
import 'package:genotek/core/error/failures.dart';
import 'package:genotek/features/price_list/domain/entities/price.dart';

abstract class PriceRepository {
  Future<Either<Failure, List<Price>>> getPrices();
}
