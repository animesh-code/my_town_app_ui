part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final String placeId;
  final String name;
  final FormSubmissionStatus formStatus;
  final LoginState loginState;

  const RegisterState({
    this.placeId = '',
    this.name = '',
    this.formStatus = const InitialFormStatus(),
    this.loginState = const LoginInitial(),
  });

  RegisterState copyWith({
    String token,
    String placeId,
    String name,
    FormSubmissionStatus formStatus,
    LoginState loginState,
  }) {
    return RegisterState(
      placeId: this.placeId ?? placeId,
      name: this.name ?? name,
      formStatus: this.formStatus ?? formStatus,
      loginState: this.loginState ?? loginState,
    );
  }

  @override
  List<Object> get props => [placeId, name, formStatus, loginState];
}
