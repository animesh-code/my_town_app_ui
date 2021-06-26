import 'package:async/async.dart';

import '../../domain/credential.dart';
import '../../domain/token.dart';

abstract class IAuthApi {
  Future<Result<bool>> check(Credential credential);
  Future<Result<String>> login(Credential credential);
  Future<Result<String>> register(Credential credential);
  Future<Result<bool>> logout(Token token);
}
