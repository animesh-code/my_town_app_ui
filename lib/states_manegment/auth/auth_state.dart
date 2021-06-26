part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class LodingState extends AuthState {
  @override
  List<Object> get props => [];
}

class SuccessState extends AuthState {
  final Token token;
  SuccessState(this.token);

  @override
  List<Object> get props => [token];
}

class CheckTrueState extends AuthState {
  @override
  List<Object> get props => [];
}

class CheckFalseState extends AuthState {
  @override
  List<Object> get props => [];
}

class ErrorState extends AuthState {
  final String message;
  ErrorState(this.message);
  @override
  List<Object> get props => [];
}

class LogOutSuccessState extends AuthState {
  @override
  List<Object> get props => [];
}

class RequestOtpSuccessState extends AuthState {
  final String requestId;

  RequestOtpSuccessState(this.requestId);

  @override
  List<Object> get props => [requestId];
}

class CheckOtpSuccessState extends AuthState {
  final String number;

  CheckOtpSuccessState(this.number);
  @override
  List<Object> get props => [number];
}

class CancelOtpSuccessState extends AuthState {
  @override
  List<Object> get props => [];
}
