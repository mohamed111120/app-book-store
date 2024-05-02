import 'package:book_store/core/custom_navigation_bar_cubit/custon_navigation_bar_cubit.dart';
import 'package:book_store/core/services/local/shared_helper.dart';
import 'package:book_store/core/services/local/shared_keys.dart';
import 'package:book_store/core/services/network/dio_helper.dart';
import 'package:book_store/core/theme/dark_theme.dart';
import 'package:book_store/core/theme/light_theme.dart';
import 'package:book_store/core/theme/theme_cubit/theme_cubit.dart';
import 'package:book_store/features/cart/view_model/cart_cubit/cart_cubit.dart';
import 'package:book_store/features/home_layout/view/home_layout.dart';
import 'package:book_store/features/login/view_model/login_cubit/login_cubit.dart';
import 'package:book_store/features/register/view/register_screen.dart';
import 'package:book_store/features/register/view_model/register_cubit/register_cubit.dart';
import 'package:book_store/features/single_category/view_model/single_category_cubit/single_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bloc_observer.dart';
import 'features/books/view_model/books_cubit/books_cubit.dart';
import 'features/favorites/view_model/favorites_cubit/favorites_cubit.dart';
import 'features/home/view_model/home_cubits/best_seller_cubit/best_seller_cubit.dart';
import 'features/home/view_model/home_cubits/categories_cubit/categories_cubit.dart';
import 'features/home/view_model/home_cubits/new_arrivals_cubit/new_arrivals_cubit.dart';
import 'features/home/view_model/home_cubits/slider_cubit/slider_cubit.dart';
import 'features/profile/view_model/profile_cubit/profile_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.initDioHelper();
  await SharedPreference.initSharedPreference();
  Bloc.observer = MyBlocObserver();
  // SharedPreference.removeData(key: SharedPreferenceKey.token);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var token = SharedPreference.getData(key: SharedPreferenceKey.token) ;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterCubit(),),
        BlocProvider(create: (context) => LoginCubit(),),
        BlocProvider(create: (context) => ThemeCubit(),),
        BlocProvider(create: (context) => SliderCubit(),),
        BlocProvider(create: (context) => BestSellerCubit(),),
        BlocProvider(create: (context) => CategoriesCubit(),),
        BlocProvider(create: (context) => NewArrivalsCubit(),),
        BlocProvider(create: (context) => SingleCategoryCubit(),),
        BlocProvider(create: (context) => CustomNavigationBarCubit(),),
        BlocProvider(create: (context) => ProfileCubit(),),
        BlocProvider(create: (context) => BooksCubit(),),
        BlocProvider(create: (context) => FavoritesCubit(),),
        BlocProvider(create: (context) => CartCubit(),),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                darkTheme: darkTeme,
                theme: lightTheme,
                themeMode: ThemeCubit
                    .get(context)
                    .isDark ? ThemeMode.dark : ThemeMode.light,
                debugShowCheckedModeBanner: false,
                home:  child ,
              );
            },
            child: token ==null ? const RegisterScreen() :const HomeLayout() ,
          );
        },
      ),
    );
  }
}
