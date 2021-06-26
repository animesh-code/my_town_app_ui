import 'package:auth/auth.dart';
import 'package:auth/src/domain/verify_credential.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  http.Client client;
  VerifyApi sut;
  String baseUrl = 'http://localhost:3000';

  setUp(() {
    client = http.Client();
    sut = VerifyApi(baseUrl, client);
  });

  group('RequestOtp', () {
    test('should return a request id if successful', () async {
      //arrange
      var credential = VerifyCredential(number: '+918513081437');

      //act
      var result = await sut.request(credential);
      print(result.asValue.value);

      //assert
      expect(result.asValue.value, isNotEmpty);
    });

    test('should return a error when unsuccessful', () async {
      //arrange
      var credential = VerifyCredential(number: '9185130814');

      //act
      var result = await sut.request(credential);
      print(result);

      //assert
      expect(result.isError, true);
    });
  });
}
