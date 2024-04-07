import 'package:book_store/core/services/local/shared_helper.dart';
import 'package:book_store/core/services/local/shared_keys.dart';
import 'package:book_store/core/utils/app_colors.dart';
import 'package:book_store/core/utils/custom_navigator.dart';
import 'package:book_store/core/utils/widgets/custom_text.dart';
import 'package:book_store/features/login/view/login_screen.dart';
import 'package:book_store/features/profile_screen/view_model/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../custom_navigation_bar_cubit/custon_navigation_bar_cubit.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomNavigationBarCubit.get(context).currentIndex == 4
        ? AppBar(
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: AppColor.primary,
            title: const CustomText(
              text: 'Profile',
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            actions: [
              BlocListener<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if(state is LogoutProfileSuccessState){
                    CustomNavigator.pushAndRemoveUntil(context, const LoginScreen());
                  }
                },
                child: InkWell(
                  onTap: () {
                    ProfileCubit.get(context).logOut();
                  },
                  child: const FaIcon(
                    FontAwesomeIcons.rightFromBracket,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
              )
            ],
          )
        : AppBar(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text:
                      'Hi ${SharedPreference.getData(key: SharedPreferenceKey.name)}',
                  fontSize: 16.sp,
                ),
                CustomText(
                  text: 'What are you reading today? ',
                  color: Colors.grey,
                  fontSize: 16.sp,
                ),
              ],
            ),
            actions: [
              CircleAvatar(
                radius: 30,
                backgroundImage: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJfPib7CWEiNiu18DRUk_FDdZR0KNSI4oz_g&s')
                    .image,
              ),
              SizedBox(
                width: 15.w,
              )
            ],
          );
  }

  @override
  Size get preferredSize => Size(
        double.maxFinite,
        60.h,
      );
}
