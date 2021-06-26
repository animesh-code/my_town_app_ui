import 'package:async/async.dart';

import '../domain/auth_service_contract.dart';
import '../domain/token.dart';

class LogOutUseCase {
  final IAuthService _authService;

  LogOutUseCase(this._authService);

  Future<Result<bool>> execute(Token token) async {
    return await _authService.logout(token);
  }
}
