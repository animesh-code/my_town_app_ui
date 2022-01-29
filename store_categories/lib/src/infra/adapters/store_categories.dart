import 'package:async/async.dart';

import 'package:store_categories/src/domain/store_categories_service_contract.dart';
import 'package:store_categories/src/domain/store_category.dart';
import 'package:store_categories/src/infra/api/store_categories_api_contract.dart';

class ShopCategories implements IStoreCategoriesService {
  final IStoreCategoriesApi _api;

  ShopCategories(this._api);

  @override
  Future<Result<StoreCategories>> fetch() async {
    var result = await _api.fetch();
    if (result.isError) return result.asError;
    return Result.value(result.asValue.value);
  }
}
