import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

import '../../infra/api/mapper.dart';
import '../../domain/token.dart';
import '../../domain/credential.dart';
import '../../infra/api/auth_api_contract.dart';

class AuthApi implements IAuthApi {
  final http.Client _client;
  String baseUrl;

  AuthApi(this.baseUrl, this._client);

  @override
  Future<Result<bool>> check(Credential credential) async {
    var endpoint = baseUrl + '/auth/check';
    return await _checkUser(endpoint, credential);
  }

  @override
  Future<Result<String>> login(Credential credential) async {
    var endpoint = baseUrl + '/auth/login';
    return await _postCredential(endpoint, credential);
  }

  @override
  Future<Result<bool>> logout(Token token) async {
    var endpoint = baseUrl + '/auth/logout';
    var headers = {
      "Content-type": "application/json",
      "Authorization": token.value
    };
    var response = await _client.post(Uri.parse(endpoint), headers: headers);
    if (response.statusCode != 200) return Result.value(false);
    return Result.value(true);
  }

  @override
  Future<Result<String>> register(Credential credential) async {
    var endpoint = baseUrl + '/auth/register';
    return await _postCredential(endpoint, credential);
  }

  Future<Result<String>> _postCredential(
      String endpoint, Credential credential) async {
    var response = await _client.post(
      Uri.parse(endpoint),
      body: jsonEncode(Mapper.toJson(credential)),
      headers: {"Content-type": "application/json"},
    );

    if (response.statusCode != 200) {
      return Result.error('Server error');
    }
    dynamic json = jsonDecode((response.body));

    return json["auth_token"] != null
        ? Result.value(json["auth_token"])
        : Result.error(json["message"]);
    // return Result.value(json);
  }

  Future<Result<bool>> _checkUser(
      String endpoint, Credential credential) async {
    var response = await _client.post(Uri.parse(endpoint),
        body: jsonEncode(Mapper.toJson(credential)),
        headers: {"Content-type": "application/json"});

    var json = jsonDecode(response.body);
    return Result.value(json['value']);
  }
}
