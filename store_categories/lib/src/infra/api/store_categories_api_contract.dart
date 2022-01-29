import 'package:async/async.dart';
import 'package:store_categories/src/domain/store_category.dart';

abstract class IStoreCategoriesApi {
  Future<Result<StoreCategories>> fetch();
}
