import 'package:auth/auth.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();

  @override
  List<Object> get props => [];
}

class AttemptingLogin extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  final Token token;

  LoginSuccess({this.token});
  @override
  List<Object> get props => [token];
}

class LoginFailed extends LoginState {
  final String message;

  LoginFailed({this.message});
  @override
  List<Object> get props => [message];
}
