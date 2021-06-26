part of 'otp_bloc.dart';

class OtpState extends Equatable {
  final String otp;
  final FormSubmissionStatus formStatus;
  final LoginState loginstate;

  const OtpState({
    this.otp = '',
    this.formStatus = const InitialFormStatus(),
    this.loginstate = const LoginInitial(),
  });

  OtpState copyWith({
    String otp,
    FormSubmissionStatus formStatus,
    LoginState loginState,
  }) {
    return OtpState(
      otp: otp ?? this.otp,
      formStatus: formStatus ?? this.formStatus,
      loginstate: loginstate ?? this.loginstate,
    );
  }

  @override
  List<Object> get props => [otp, formStatus, loginstate];
}
