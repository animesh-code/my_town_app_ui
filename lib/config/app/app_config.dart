import 'package:auth/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:my_town/cache/local_store.dart';
import 'package:my_town/cache/local_store_contract.dart';
import 'package:my_town/presentation/screens/core/auth/number/number_page.dart';
import 'package:my_town/presentation/screens/core/auth/otp/otp_page.dart';
import 'package:my_town/presentation/screens/core/auth/register/register_page.dart';
import 'package:my_town/presentation/screens/main/home_page.dart';
import 'package:my_town/states_manegment/core/auth/auth_cubit.dart';
import 'package:my_town/states_manegment/core/number/number_bloc.dart';
import 'package:my_town/states_manegment/core/otp/otp_bloc.dart';
import 'package:my_town/states_manegment/core/register/register_bloc.dart';
import 'package:my_town/states_manegment/location/location_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfig {
  static SharedPreferences _sharedPreferences;
  static ILocalStore _localStore;
  static String _baseUrl;
  static Client _client;
  static IVerifyApi _api;
  static ILocationApi _locationApi;
  static IVerifyService _verifyService;
  static ILocationService _locationService;
  static IAuthApi _authApi;
  static IAuthService _authService;
  static Token _token;

  static configure() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _localStore = LocalStore(_sharedPreferences);
    _client = Client();
    _baseUrl = "http://10.0.2.2:3000";
    _api = VerifyApi(_baseUrl, _client);
    _locationApi = LocationApi(_baseUrl, _client);
    _authApi = AuthApi(_baseUrl, _client);
    _verifyService = Verify(_api);
    _locationService = Location(_locationApi);
    _authService = Auth(_authApi);
    _token = await _localStore.fetch();
  }

  static AuthCubit _authCubit = AuthCubit();

  static Widget composeInitialUi() {
    if (_token == null) {
      return composeNumberUi();
    } else {
      return HomePage();
    }
  }

  static Widget composeNumberUi() {
    final IVerifyService verifyService = _verifyService;
    NumberBloc _numberBloc = NumberBloc(
      verifyService: verifyService,
      authCubit: _authCubit,
    );

    return BlocProvider(
      create: (_) => _numberBloc,
      child: NumberPage(),
    );
  }

  static Widget composeOtpUi(String number) {
    final IVerifyService verifyService = _verifyService;
    final IAuthService authService = _authService;
    OtpBloc _otpBloc = OtpBloc(
      verifyService: verifyService,
      authCubit: _authCubit,
      authService: authService,
      localStore: _localStore,
    );

    return BlocProvider(
      create: (_) => _otpBloc,
      child: OtpPage(number: number),
    );
  }

  static Widget composeRegisterUi() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBloc>(
          create: (_) => RegisterBloc(
            authService: _authService,
            authCubit: _authCubit,
            localStore: _localStore,
          ),
        ),
        BlocProvider<LocationCubit>(
          create: (_) => LocationCubit(locationService: _locationService),
        ),
      ],
      child: RegisterPage(),
    );
  }

  static dispose() {
    _authCubit.close();
  }
}
