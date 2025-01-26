import 'package:dartz/dartz.dart';
import 'package:genotek/core/error/failures.dart';
import 'package:genotek/features/price_list/domain/entities/price.dart';
import 'package:genotek/features/price_list/domain/repositories/price_repository.dart';

class GetPrices {
  final PriceRepository repository;

  const GetPrices(this.repository);

  Future<Either<Failure, List<Price>>> call() async {
    return await repository.getPrices();
  }
}
