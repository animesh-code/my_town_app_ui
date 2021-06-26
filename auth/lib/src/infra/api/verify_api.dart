import 'dart:convert';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;

import '../../domain/verify_credential.dart';
import '../../infra/api/mapper.dart';
import '../../infra/api/verify_api_contract.dart';

class VerifyApi implements IVerifyApi {
  final http.Client _client;
  String baseUrl;

  VerifyApi(this.baseUrl, this._client);
  @override
  Future<Result<bool>> check(VerifyCredential credential) async {
    var endpoint = baseUrl + '/auth/otp/check';
    var response = await _postCredential(endpoint, credential);

    dynamic json = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return Result.value(true);
    } else if (json['status'] == 16) {
      return Result.value(false);
    } else {
      return Result.error('Server error');
    }
  }

  @override
  Future<Result<String>> request(VerifyCredential credential) async {
    var endpoint = baseUrl + '/auth/otp/request';
    var response = await _postCredential(endpoint, credential);

    if (response.statusCode != 200) {
      return Result.error('Server error. Try after 10 minutes');
    }
    dynamic json = jsonDecode(response.body);

    return json["status"] == '0'
        ? Result.value(json["request_id"])
        : Result.error(json["error_text"]);
  }

  Future<http.Response> _postCredential(
      String endpoint, VerifyCredential credential) async {
    var response = await _client.post(
      Uri.parse(endpoint),
      body: jsonEncode(Mapper.toJsonVerify(credential)),
      headers: {"Content-type": "application/json"},
    );

    return response;
  }

  @override
  Future<Result<bool>> cancel(VerifyCredential credential) async {
    var endpoint = baseUrl + '/auth/otp/cancel';
    var response = await _postCredential(endpoint, credential);

    dynamic json = jsonDecode(response.body);
    if (json["status"] != '0') return Result.value(false);

    return Result.value(true);
  }
}
