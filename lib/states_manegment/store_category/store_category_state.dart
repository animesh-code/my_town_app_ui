part of 'store_category_cubit.dart';

abstract class StoreCategoryState extends Equatable {}

class StoreCategoryLoading extends StoreCategoryState {
  @override
  List<Object> get props => null;
}

class StoreCategoryLoaded extends StoreCategoryState {
  final StoreCategories categories;

  StoreCategoryLoaded({this.categories});
  @override
  List<Object> get props => [categories];
}

class StoreCategoryInterrupt extends StoreCategoryState {
  final message;

  StoreCategoryInterrupt({this.message});
  @override
  List<Object> get props => [message];
}
