import 'package:dio/dio.dart';
import 'package:genotek/core/constants/api.dart';
import 'package:genotek/core/constants/strings.dart';
import 'package:genotek/core/services/logger.dart';
import 'package:genotek/features/price_list/data/datasources/price_remote_data_source.dart';
import 'package:genotek/features/price_list/data/datasources/server_exception.dart';
import 'package:genotek/features/price_list/data/models/price_model.dart';

class PriceRemoteDataSourceImpl implements PriceRemoteDataSource {
  final Dio client;

  PriceRemoteDataSourceImpl({required this.client}) {
    client.options.baseUrl = Api.baseUrl;
    client.options.connectTimeout = Api.timeout;
    client.options.receiveTimeout = Api.timeout;
  }

  @override
  Future<List<PriceModel>> getPrices() async {
    try {
      final response = await client.get(Api.prices);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        List<PriceModel> prices = [];

        void processSection(Map<String, dynamic> section) {
          section.forEach((href, details) {
            if (details is Map<String, dynamic>) {
              try {
                prices.add(PriceModel.fromJson(href, details));
              } catch (e) {
                Logger.log('${Strings.debugParsingError}$href: $e');
              }
            }
          });
        }

        if (data.containsKey(Api.sectionDiagnostic)) {
          processSection(data[Api.sectionDiagnostic] as Map<String, dynamic>);
        }
        if (data.containsKey(Api.sectionGenetics)) {
          processSection(data[Api.sectionGenetics] as Map<String, dynamic>);
        }
        if (data.containsKey(Api.sectionPremium)) {
          processSection(data[Api.sectionPremium] as Map<String, dynamic>);
        }

        return prices;
      }
      throw ServerException('${Strings.httpError}${response.statusCode}');
    } catch (e) {
      Logger.log('${Strings.debugGetPricesError}$e');
      throw ServerException(e.toString());
    }
  }
}
