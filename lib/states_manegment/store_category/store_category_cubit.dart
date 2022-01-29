import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_categories/store_categories.dart';

part 'store_category_state.dart';

class StoreCategoryCubit extends Cubit<StoreCategoryState> {
  final IStoreCategoriesService storeCategoriesService;

  StoreCategoryCubit({this.storeCategoriesService})
      : super(StoreCategoryLoading());

  fetch() async {
    final result = await storeCategoriesService.fetch();

    if (result.isError) {
      emit(StoreCategoryInterrupt(message: result.asError.error));
    }

    emit(StoreCategoryLoaded(categories: result.asValue.value));
  }
}
