import 'package:async/async.dart';

import '../../domain/auth_service_contract.dart';
import '../../domain/credential.dart';
import '../../domain/token.dart';
import '../../infra/api/auth_api_contract.dart';

class Auth implements IAuthService {
  final IAuthApi _api;
  Credential _credential;

  Auth(this._api);

  void credential(String number) {
    _credential = Credential(number: number);
  }

  @override
  Future<Result<bool>> check() async {
    assert(_credential != null);
    var result = await _api.check(_credential);
    if (result.isError) return result.asError;
    return Result.value(result.asValue.value);
  }

  @override
  Future<Result<Token>> login(String number) async {
    Credential credential = Credential(number: number);
    var result = await _api.login(credential);
    if (result.isError) return result.asError;
    return Result.value(Token(result.asValue.value));
  }

  @override
  Future<Result<bool>> logout(Token token) async {
    return await _api.logout(token);
  }

  @override
  Future<Result<Token>> register(
      String placeId, String number, String name) async {
    Credential credential = Credential(
      placeId: placeId,
      number: number,
      name: name,
    );

    var result = await _api.register(credential);
    if (result.isError) return result.asError;
    return Result.value(Token(result.asValue.value));
  }
}
