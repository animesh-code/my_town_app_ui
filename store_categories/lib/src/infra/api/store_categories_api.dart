import 'dart:convert';

import 'package:async/async.dart';
import 'package:http/http.dart' as http;

import 'package:store_categories/src/domain/store_category.dart';
import 'package:store_categories/src/infra/api/store_categories_api_contract.dart';

class StoreCategoriesApi implements IStoreCategoriesApi {
  final http.Client _client;
  String baseUrl;

  StoreCategoriesApi(
    this.baseUrl,
    this._client,
  );
  @override
  Future<Result<StoreCategories>> fetch() async {
    var endpoint = baseUrl + '/shopCategory/getAll';

    var response = await _client.get(
      Uri.parse(endpoint),
      headers: {"Content-type": "application/json"},
    );

    if (response.statusCode != 200) {
      return Result.error('Server error');
    }

    Map<String, dynamic> json = jsonDecode(response.body);

    var result = StoreCategories.fromJson(json);

    return Result.value(result);
  }
}
