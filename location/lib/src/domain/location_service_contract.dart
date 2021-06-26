import 'package:async/async.dart';
import 'package:location/src/domain/place.dart';

abstract class ILocationService {
  Future<Result<Places>> getAll();
  Future<Result<Place>> get(String id);
}
