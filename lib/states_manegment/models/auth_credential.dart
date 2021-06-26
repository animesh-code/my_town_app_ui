import 'package:flutter/cupertino.dart';

class AuthCredential {
  final String number;
  final String requestId;

  AuthCredential({
    @required this.number,
    @required this.requestId,
  });
}
