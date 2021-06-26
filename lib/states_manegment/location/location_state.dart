part of 'location_cubit.dart';

abstract class LocationState extends Equatable {}

class LocationLoading extends LocationState {
  @override
  List<Object> get props => null;
}

class LocationInterrupt extends LocationState {
  final message;
  LocationInterrupt(this.message);
  @override
  List<Object> get props => [message];
}

class LocationLoaded extends LocationState {
  final Places places;

  LocationLoaded({this.places});
  @override
  List<Object> get props => [places];
}
