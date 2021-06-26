import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:async/async.dart';

import '../../cache/local_store_contract.dart';
import '../../models/Credential.dart';
import '../../models/User.dart';

part 'auth_state.dart';

class PreAuthCubit extends Cubit<AuthState> {
  final ILocalStore localStore;
  PreAuthCubit(this.localStore) : super(AuthInitial());

  login(IAuthService authService) async {
    _startLoding();
    final result = await authService.login('');
    _setResultOfAuthState(result);
  }

  logout(IAuthService authService) async {
    _startLoding();
    final token = await localStore.fetch();
    final result = await authService.logout(token);
    if (result.asValue.value) {
      localStore.delete(token);
      emit(LogOutSuccessState());
    } else {
      emit(ErrorState('Error logging out'));
    }
  }

  register(IAuthService authService, User user) async {
    _startLoding();
    final result =
        await authService.register(user.placeId, user.number, user.name);
    _setResultOfAuthState(result);
  }

  check(IAuthService authService) async {
    _startLoding();
    final result = await authService.check();
    if (result.asValue.value) emit(CheckTrueState());
    emit(CheckFalseState());
  }

  requestOtp(IVerifyService verifyService, Credential credential) async {
    _startLoding();
    Future.delayed(
      Duration(seconds: 4),
      () => emit(
        // ErrorState('Sorry! Something went wrong'),
        RequestOtpSuccessState('3456729'),
      ),
    );
    // final result = await verifyService.request(credential.number);
    // if (result.isError) emit(ErrorState(result.asError.error));
    // emit(RequestOtpSuccessState(''));
  }

  checkOtp(IVerifyService verifyService, Credential credential) async {
    _startLoding();
    Future.delayed(
      Duration(seconds: 4),
      () => emit(
        // ErrorState('Sorry! Something went wrong'),
        CheckOtpSuccessState(
          credential.number.toString(),
        ),
      ),
    );
    // final result = await verifyService.check(
    //     credential.number, credential.requestId, credential.code);
    // if (result.isError) emit(ErrorState(result.asError.error));
    // emit(CheckOtpSuccessState(result.asValue.value));
  }

  cancelOtp(IVerifyService verifyService, Credential credential) async {
    _startLoding();
    final result = await verifyService.cancel(credential.requestId);
    if (result.isError) emit(ErrorState(result.asError.error));
    emit(CancelOtpSuccessState());
  }

  void _setResultOfAuthState(Result<Token> result) {
    if (result.isError) {
      emit(ErrorState(result.asError.error));
      return;
    }
    emit(SuccessState(result.asValue.value));
  }

  void _startLoding() {
    emit(LodingState());
  }
}
