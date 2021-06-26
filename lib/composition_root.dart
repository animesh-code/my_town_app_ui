import 'package:auth/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_town/cache/local_store.dart';
import 'package:my_town/states_manegment/auth/auth_cubit.dart';
import 'package:my_town/ui/pages/enter_number_page.dart';
import 'package:my_town/ui/pages/otp_page.dart';
import 'package:my_town/ui/pages/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cache/local_store_contract.dart';

class CompositionRoot {
  static SharedPreferences _sharedPreferences;
  static ILocalStore _localStore;
  static String _baseUrl;
  static Client _client;
  static IVerifyApi _api;
  static IVerifyService _verifyService;

  static configure() {
    _localStore = LocalStore(_sharedPreferences);
    _client = Client();
    _baseUrl = "http://10.0.2.2:3000";
    _api = VerifyApi(_baseUrl, _client);
    _verifyService = Verify(_api);
  }

  static PreAuthCubit _authCubit = PreAuthCubit(_localStore);

  static Widget composeNumberUi() {
    return BlocProvider.value(
      value: _authCubit,
      child: EnterNumberPage(_verifyService),
    );
  }

  static Widget composeOtpUi(String number) {
    final inputNumber = number;
    return BlocProvider.value(
      value: _authCubit,
      child: OtpPage(inputNumber, _verifyService),
    );
  }

  static Widget composeRegisterUi() {
    return BlocProvider.value(
      value: _authCubit,
      child: RegisterPage(_verifyService),
    );
  }

  static dispose() {
    _authCubit.close();
  }
}
