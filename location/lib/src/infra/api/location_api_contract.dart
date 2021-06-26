import 'package:async/async.dart';
import 'package:location/src/domain/place.dart';

abstract class ILocationApi {
  Future<Result<Places>> getAll();
  Future<Result<Place>> get(String id);
}
