import 'package:location/location.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final ILocationService locationService;

  LocationCubit({this.locationService}) : super(LocationLoading());

  fetch() async {
    final result = await locationService.getAll();
    if (result.isError) {
      emit(LocationInterrupt(result.asError.error));
    }
    emit(LocationLoaded(places: result.asValue.value));
  }
}
