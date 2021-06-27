import 'dart:async';

import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_town/states_manegment/auth/auth_cubit.dart';
import 'package:my_town/states_manegment/core/auth/auth_cubit.dart';
import 'package:my_town/states_manegment/core/form_submission_status.dart';

part 'number_event.dart';
part 'number_state.dart';

class NumberBloc extends Bloc<NumberEvent, NumberState> {
  final IVerifyService verifyService;
  final AuthCubit authCubit;

  NumberBloc({
    this.verifyService,
    this.authCubit,
  }) : super(NumberState());

  @override
  Stream<NumberState> mapEventToState(
    NumberEvent event,
  ) async* {
    // Number updated
    if (event is NumberChanged) {
      yield state.copyWith(number: event.number);

      // Number submitted
    } else if (event is NumberSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        final result = await verifyService.request(state.number);

        if (result.asError is ErrorState) {
          yield state.copyWith(
              formStatus: SubmissionFailed(result.asError.error));
        }
        authCubit.initialize(
            number: state.number, requestId: result.asValue.value);
        print(authCubit.credentials.requestId);
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    } else if (event is NumberFailed) {
      yield state.copyWith(formStatus: InitialFormStatus());
    }
  }
}
