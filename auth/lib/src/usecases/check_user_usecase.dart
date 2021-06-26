import 'package:async/async.dart';

import '../domain/auth_service_contract.dart';

class CheckUserUseCase {
  final IAuthService _authService;

  CheckUserUseCase(this._authService);

  Future<Result<bool>> execute() async {
    return await _authService.check();
  }
}
