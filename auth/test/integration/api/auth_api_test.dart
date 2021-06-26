import 'package:auth/src/domain/credential.dart';
import 'package:auth/src/domain/token.dart';
import 'package:auth/src/infra/api/auth_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  http.Client client;
  AuthApi sut;
  String baseUrl = 'http://localhost:3000';

  setUp(() {
    client = http.Client();
    sut = AuthApi(baseUrl, client);
  });

  var credential = Credential(number: '8513081437');
  group('Login', () {
    test("should return json web token when successful", () async {
      //act
      var result = await sut.login(credential);
      print(result.asValue.value);

      //assert
      expect(result.asValue.value, isNotEmpty);
    });
    test("should return nothing when fail", () async {
      //arrange
      var _credential = Credential(number: '9775509714');
      //act
      var result = await sut.login(_credential);

      //assert
      expect(result.isError, true);
    });
  });

  group('logout', () {
    test('should log out user and return true', () async {
      //arrange
      var tokenStr = await sut.login(credential);
      var token = Token(tokenStr.asValue.value);
      print(token.value);
      //act
      var result = await sut.logout(token);
      print(result.asValue.value);
      //assert
      expect(result.asValue.value, true);
    });
  });

  group('check', () {
    test('should return true if user already exist', () async {
      //act
      var result = await sut.check(credential);
      //assert
      expect(result.asValue.value, true);
    });
    test('should return false if user does not exist', () async {
      //arrange
      var _credential = Credential(number: '9775509714');
      //act
      var result = await sut.check(_credential);
      //assert
      expect(result.asValue.value, false);
    });
  });
}
