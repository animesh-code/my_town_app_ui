import 'package:flutter/foundation.dart';

class Credential {
  final String code;
  final String requestId;
  final String placeId;
  final String number;
  final String name;
  final bool donor;
  final String bloodGroup;

  Credential({
    this.code,
    this.requestId,
    @required this.number,
    this.name,
    this.placeId,
    this.donor,
    this.bloodGroup,
  });
}
