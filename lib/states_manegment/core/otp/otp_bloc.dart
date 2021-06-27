import 'dart:async';

import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_town/cache/local_store_contract.dart';
import 'package:my_town/states_manegment/core/auth/auth_cubit.dart';
import 'package:my_town/states_manegment/core/form_submission_status.dart';
import 'package:my_town/states_manegment/core/login_state.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final IVerifyService verifyService;
  final IAuthService authService;
  final AuthCubit authCubit;
  final ILocalStore localStore;

  OtpBloc({
    this.verifyService,
    this.authService,
    this.authCubit,
    this.localStore,
  }) : super(OtpState());

  @override
  Stream<OtpState> mapEventToState(
    OtpEvent event,
  ) async* {
    // Otp updated
    if (event is OtpChanged) {
      yield state.copyWith(otp: event.otp);
    }

    // Otp submitted
    if (event is OtpSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        final result = await verifyService.check(
          authCubit.credentials.number,
          authCubit.credentials.requestId,
          state.otp,
        );
        if (result.asError != null) {
          yield state.copyWith(
              formStatus: SubmissionFailed(result.asError.error));
        } else if (result.asValue != null && result.asValue.value) {
          try {
            // Try login
            yield state.copyWith(loginState: AttemptingLogin());
            final token = await authService.login(authCubit.credentials.number);

            if (token.asError != null) {
              yield state.copyWith(
                  loginState: LoginFailed(message: token.asError.error));
            } else {
              localStore.save(token.asValue.value);
              yield state.copyWith(
                  loginState: LoginSuccess(token: token.asValue.value));
            }
          } catch (e) {
            yield state.copyWith(
                loginState: LoginFailed(message: 'Need to register'));
          }
          yield state.copyWith(formStatus: SubmissionSuccess());
        } else if (result.asValue != null && !result.asValue.value) {
          yield state.copyWith(
              formStatus: SubmissionFailed("Otp didn't match"));
        }
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    } else if (event is OtpFailed) {
      yield state.copyWith(
        formStatus: InitialFormStatus(),
        loginState: LoginInitial(),
      );
    }
  }
}
