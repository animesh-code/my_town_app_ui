import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_town/states_manegment/models/auth_credential.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  AuthCredential credentials;

  void initialize({String number, String requestId}) {
    credentials = AuthCredential(number: number, requestId: requestId);
  }
}
