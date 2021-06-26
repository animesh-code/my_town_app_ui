import 'package:async/async.dart';

import 'token.dart';

abstract class IAuthService {
  Future<Result<bool>> check();
  Future<Result<Token>> login(String number);
  Future<Result<Token>> register(
    String placeId,
    String number,
    String name,
  );
  Future<Result<bool>> logout(Token token);
}
