part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object> get props => [];
}

class OtpChanged extends OtpEvent {
  final String otp;

  OtpChanged({this.otp});
}

class OtpSubmitted extends OtpEvent {}
