import 'package:async/async.dart';

import '../domain/auth_service_contract.dart';
import '../domain/token.dart';

class RegisterUseCase {
  final IAuthService _authService;

  RegisterUseCase(this._authService);

  Future<Result<Token>> execute(
    String placeId,
    String number,
    String name,
  ) async {
    return await _authService.register(placeId, number, name);
  }
}
