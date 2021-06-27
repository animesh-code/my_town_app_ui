part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {}

class OtpChanged extends OtpEvent {
  final String otp;

  OtpChanged({this.otp});

  @override
  List<Object> get props => [otp];
}

class OtpSubmitted extends OtpEvent {
  @override
  List<Object> get props => null;
}

class OtpFailed extends OtpEvent {
  @override
  List<Object> get props => null;
}
