import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'single_category_state.dart';

class SingleCategoryCubit extends Cubit<SingleCategoryState> {
  SingleCategoryCubit() : super(SingleCategoryInitial());
}
