import 'package:book_store/core/services/local/shared_helper.dart';
import 'package:book_store/core/services/network/dio_helper.dart';
import 'package:book_store/core/theme/dark_theme.dart';
import 'package:book_store/core/theme/light_theme.dart';
import 'package:book_store/core/theme/theme_cubit/theme_cubit.dart';
import 'package:book_store/features/login/view/login_screen.dart';
import 'package:book_store/features/login/view_model/login_cubit/login_cubit.dart';
import 'package:book_store/features/register/view/register_screen.dart';
import 'package:book_store/features/register/view_model/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.initDioHelper();
  SharedPreference.initSharedPreference();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterCubit(),),
        BlocProvider(create: (context) => LoginCubit(),),
        BlocProvider(create: (context) => ThemeCubit(),),

      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            darkTheme: darkTeme,
            theme: lightTheme,
            themeMode: ThemeCubit
                .get(context)
                .isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: RegisterScreen(),
          );
        },
      ),
    );
  }
}
