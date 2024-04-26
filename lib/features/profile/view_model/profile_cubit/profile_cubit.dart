import 'package:book_store/core/services/local/shared_helper.dart';
import 'package:book_store/core/services/local/shared_keys.dart';
import 'package:book_store/core/services/network/dio_helper.dart';
import 'package:book_store/core/services/network/end_points.dart';
import 'package:book_store/core/utils/widgets/custom_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of<ProfileCubit>(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController emilController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  bool enableEditing = false;

  void changeEnableEditing() {
    enableEditing = !enableEditing;

    if (!enableEditing) {
      updateProfileData();
    }
    emit(ChangeEnableEditingState());
  }

  void showProfileDAta() async {
    emit(ShowProfileLoadingState());
    await DioHelper.get(
      url: EndPoints.showProfile,
      withToken: true,
    ).then((value) {
      nameController.text = value.data['data']['name'];
      emilController.text = value.data['data']['email'];
      phoneController.text = value.data['data']['phone'];
      cityController.text = value.data['data']['city'];
      addressController.text = value.data['data']['address'];
      emit(ShowProfileSuccessState());
    }).catchError((error) {
      emit(ShowProfileErrorState());
    });
  }

  void updateProfileData() async {
    emit(UpdateProfileLoadingState());
    await DioHelper.post(
      url: EndPoints.updateProfile,
      data: {
        'name': nameController.text,
        'address': addressController.text,
        'city': cityController.text,
        'phone': phoneController.text,
      },
      withToken: true,
    ).then((value) {
      emit(UpdateProfileSuccessState());
      SharedPreference.setData(
          key: SharedPreferenceKey.name, value: value.data['data']['name']);
      showToast(message: value.data['message'], state: ToastState.success);
    }).catchError((error) {
      emit(UpdateProfileErrorState());
      if (error is DioException) {
        showToast(
            message: error.response!.data['message'], state: ToastState.error);
      }
    });
  }

  void logOut() async {
    emit(LogoutProfileLoadingState());
    await DioHelper.post(url: EndPoints.logout, withToken: true).then((value) {
      emit(LogoutProfileSuccessState());
      SharedPreference.removeData(key: SharedPreferenceKey.token);
      SharedPreference.removeData(key: SharedPreferenceKey.name);
      showToast(message: value.data['message'], state: ToastState.success);
    }).catchError((error) {
      emit(LogoutProfileErrorState());
    });
  }
}
