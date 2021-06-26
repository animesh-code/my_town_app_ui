import 'package:async/async.dart';

import '../domain/verify_service_contract.dart';

class RequestOtpUseCase {
  final IVerifyService _verifyService;

  RequestOtpUseCase(this._verifyService);

  Future<Result<String>> execute(String number) async {
    return await _verifyService.request(number);
  }
}
