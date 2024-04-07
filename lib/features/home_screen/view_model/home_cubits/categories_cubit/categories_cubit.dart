import 'package:book_store/core/services/network/dio_helper.dart';
import 'package:book_store/core/services/network/end_points.dart';
import 'package:book_store/features/home_screen/model/categories_model/categories_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  
  static CategoriesCubit get(context)=> BlocProvider.of<CategoriesCubit>(context);

  List<Categories> categoriesList =[];
  Future<void> getCategories()async{
    emit(LoadingGetCategoriesState());
    await DioHelper.get(url: EndPoints.categories).then((value) {

      for(var i in value.data['data']['categories']){
        categoriesList.add(Categories.fromJson(i));
      }


      emit(SuccessGetCategoriesState());
    }).catchError((e){

      emit(ErrorGetCategoriesState());
    });
    
    
  }
  
  
  
  
}
