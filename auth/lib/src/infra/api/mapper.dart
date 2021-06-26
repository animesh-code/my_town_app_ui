import 'package:auth/src/domain/verify_credential.dart';

import '../../domain/credential.dart';

class Mapper {
  static Map<String, dynamic> toJson(Credential credential) => {
        "place_id": credential.placeId,
        "number": credential.number,
        "name": credential.name,
      };

  static Map<String, dynamic> toJsonVerify(VerifyCredential credential) => {
        "number": credential.number,
        "requestId": credential.requestId,
        "code": credential.code,
      };
}
