import 'dart:convert';

import 'package:async/async.dart';
import 'package:http/http.dart' as http;

import 'package:location/src/domain/place.dart';
import 'package:location/src/infra/api/location_api_contract.dart';

class LocationApi implements ILocationApi {
  final http.Client _client;
  String baseUrl;

  LocationApi(
    this.baseUrl,
    this._client,
  );

  @override
  Future<Result<Place>> get(String id) async {
    var endpoint = baseUrl + '/place/find/' + id;

    var response = await _client.get(
      Uri.parse(endpoint),
      headers: {"Content-type": "application/json"},
    );

    if (response.statusCode != 200) {
      return Result.error('Server error');
    }

    Map<String, dynamic> json = jsonDecode(response.body);

    var result = Place.fromJson(json);

    return Result.value(result);
  }

  @override
  Future<Result<Places>> getAll() async {
    var endpoint = baseUrl + '/place/findAll';

    var response = await _client.get(
      Uri.parse(endpoint),
      headers: {"Content-type": "application/json"},
    );

    if (response.statusCode != 200) {
      return Result.error('Server error');
    }

    Map<String, dynamic> json = jsonDecode(response.body);

    var result = Places.fromJson(json);

    return Result.value(result);
  }
}
