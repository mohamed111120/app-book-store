import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  static ThemeCubit get(context)=> BlocProvider.of<ThemeCubit>(context);

  bool isDark = false ;

  changeTheme(){
    isDark = !isDark ;
    emit(ThemeChangeStatus());
  }

}
