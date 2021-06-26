import 'package:async/async.dart';

abstract class IVerifyService {
  Future<Result<String>> request(String number);
  Future<Result<bool>> check(String number, String requestId, String code);
  Future<Result<bool>> cancel(String requestId);
}
