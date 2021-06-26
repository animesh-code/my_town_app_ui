part of 'number_bloc.dart';

abstract class NumberEvent extends Equatable {}

class NumberChanged extends NumberEvent {
  final String number;

  NumberChanged({this.number});

  @override
  List<Object> get props => [number];
}

class NumberSubmitted extends NumberEvent {
  @override
  List<Object> get props => [];
}
