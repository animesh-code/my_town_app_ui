import 'dart:async';

import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_town/cache/local_store_contract.dart';
import 'package:my_town/states_manegment/auth/auth_cubit.dart';
import 'package:my_town/states_manegment/core/auth/auth_cubit.dart';
import 'package:my_town/states_manegment/core/form_submission_status.dart';
import 'package:my_town/states_manegment/core/login_state.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final IAuthService authService;
  final AuthCubit authCubit;
  final ILocalStore localStore;
  RegisterBloc({
    this.authService,
    this.authCubit,
    this.localStore,
  }) : super(RegisterState());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is PlaceIdChanged) {
      yield state.copyWith(placeId: event.placeId);
      //
    } else if (event is NameChanged) {
      yield state.copyWith(name: event.name);
      //
    } else if (event is DataSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        final token = await authService.register(
          state.placeId,
          state.name,
          authCubit.credentials.number,
        );

        if (token.asError is ErrorState) {
          yield state.copyWith(
              formStatus: SubmissionFailed(token.asError.error));
        }
        localStore.save(token.asValue.value);
        yield state.copyWith(
          formStatus: SubmissionSuccess(),
          loginState: LoginSuccess(token: token.asValue.value),
        );
      } catch (e) {
        print('Error token');
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
  }
}
