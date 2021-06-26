import 'package:async/async.dart';

import '../domain/verify_service_contract.dart';

class VerifyOtpUseCase {
  final IVerifyService _verifyService;

  VerifyOtpUseCase(this._verifyService);

  Future<Result<bool>> execute(
      String number, String requestId, String code) async {
    return await _verifyService.check(number, requestId, code);
  }
}
