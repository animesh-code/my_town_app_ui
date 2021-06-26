part of 'number_bloc.dart';

class NumberState extends Equatable {
  final String number;
  final FormSubmissionStatus formStatus;

  const NumberState({
    this.number = '',
    this.formStatus = const InitialFormStatus(),
  });

  NumberState copyWith({
    String number,
    FormSubmissionStatus formStatus,
  }) {
    return NumberState(
      number: number ?? this.number,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object> get props => [number, formStatus];
}
