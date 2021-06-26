import 'package:async/async.dart';

import '../../domain/verify_credential.dart';

abstract class IVerifyApi {
  Future<Result<String>> request(VerifyCredential credential);
  Future<Result<bool>> check(VerifyCredential credential);
  Future<Result<bool>> cancel(VerifyCredential credential);
}
