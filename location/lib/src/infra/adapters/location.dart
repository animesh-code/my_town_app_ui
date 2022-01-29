import 'package:async/async.dart';

import 'package:location/src/domain/location_service_contract.dart';
import 'package:location/src/domain/place.dart';
import 'package:location/src/infra/api/location_api_contract.dart';

class Location implements ILocationService {
  final ILocationApi _api;

  Location(this._api);
  @override
  Future<Result<Place>> get(String id) async {
    var result = await _api.get(id);
    if (result.isError) return result.asError;
    return Result.value(result.asValue.value);
  }

  @override
  Future<Result<Places>> getAll() async {
    var result = await _api.getAll();
    if (result.isError) return result.asError;
    return Result.value(result.asValue.value);
  }
}
