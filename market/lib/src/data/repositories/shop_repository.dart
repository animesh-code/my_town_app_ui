// import 'package:async/async.dart';
import 'package:http/http.dart';
import 'package:market/src/data/models/shops_model.dart';

abstract class IShopRepository {
  Future<List<ShopModel>> getShops();
}

class ShopRepository implements IShopRepository {
  final Client _client;

  ShopRepository(this._client);

  @override
  Future<List<ShopModel>> getShops() async {
    final response = await _client.get(Uri.parse(''));
  }
}
