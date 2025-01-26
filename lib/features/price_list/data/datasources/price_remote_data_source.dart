import 'package:genotek/features/price_list/data/models/price_model.dart';

abstract class PriceRemoteDataSource {
  Future<List<PriceModel>> getPrices();
}
