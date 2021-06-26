import 'package:async/async.dart';

import '../domain/token.dart';
import '../domain/auth_service_contract.dart';

class LoginUseCase {
  final IAuthService _authService;

  LoginUseCase(this._authService);

  Future<Result<Token>> execute(String number) async {
    return await _authService.login(number);
  }
}
