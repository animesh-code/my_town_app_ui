import 'package:async/async.dart';

import '../../domain/verify_credential.dart';
import '../../domain/verify_service_contract.dart';
import '../../infra/api/verify_api_contract.dart';

class Verify implements IVerifyService {
  final IVerifyApi _api;

  Verify(this._api);
  @override
  Future<Result<bool>> check(
      String number, String requestId, String code) async {
    VerifyCredential credential =
        new VerifyCredential(number: number, code: code, requestId: requestId);
    var result = await _api.check(credential);
    if (result.isError) return result.asError;
    return Result.value(result.asValue.value);
  }

  @override
  Future<Result<String>> request(String number) async {
    VerifyCredential credential = new VerifyCredential(number: number);
    var result = await _api.request(credential);
    if (result.isError) return result.asError;
    return Result.value(result.asValue.value);
  }

  @override
  Future<Result<bool>> cancel(String requestId) async {
    VerifyCredential credential = new VerifyCredential(requestId: requestId);
    return await _api.cancel(credential);
  }
}
