import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../../../core/exceptions.dart';

import '../models/historical_price_model.dart';

abstract class HistoricalPriceRemoteDataSource {
  Future<List<HistoricalModel>> getHistorical();
}

class HistoricalPriceRemoteDataSourceImpl implements HistoricalPriceRemoteDataSource {
  final http.Client client;
  final constUrl = "https://financialmodelingprep.com/api/v3/historical-price-full/AAPL?apikey=972a40ec3fd15d05e91131e1feb80be2 ";

  HistoricalPriceRemoteDataSourceImpl({@required this.client});

  Future<List<HistoricalModel>> _getDataFromUrl(String url) async {
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var list = json.decode(response.body)["historical"] as List;
      var map1 = list.map((e) => HistoricalModel.fromJson(e)).toList();
      return map1;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<HistoricalModel>> getHistorical() {
    return _getDataFromUrl(constUrl);
  }
}