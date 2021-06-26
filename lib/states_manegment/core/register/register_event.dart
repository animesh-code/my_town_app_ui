part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {}

class PlaceIdChanged extends RegisterEvent {
  final String placeId;

  PlaceIdChanged({this.placeId});
  @override
  List<Object> get props => [placeId];
}

class NameChanged extends RegisterEvent {
  final String name;

  NameChanged({this.name});
  @override
  List<Object> get props => [name];
}

class DataSubmitted extends RegisterEvent {
  @override
  List<Object> get props => [];
}
