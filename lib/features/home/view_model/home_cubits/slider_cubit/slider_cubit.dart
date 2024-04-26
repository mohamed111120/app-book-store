import 'package:book_store/core/services/network/dio_helper.dart';
import 'package:book_store/core/services/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../model/slider_model/slider_model.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(SliderInitial());

 static SliderCubit get(context)=>BlocProvider.of<SliderCubit>(context);

  List <Sliders>sliders =[];
  Future<void> getSliderImages() async {
    emit(LoadingGetSliderState());
    await DioHelper.get(
      url: EndPoints.sliders,
    ).then((value) {
      for(var i in value.data['data']['sliders']){
        sliders.add(Sliders.fromJson(i));
      }
      emit(SuccessGetSliderState());
    }).catchError((e){
      emit(ErrorGetSliderState());
    });
  }
}
