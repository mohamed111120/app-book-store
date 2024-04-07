import 'package:book_store/features/profile_screen/view_model/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/widgets/custom_button.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return CustomButton(
            text: ProfileCubit.get(context).enableEditing
                ? 'Update Your Profile '
                : 'Edit Profile',
            textColor: Colors.white,
            onPressed: () {
              ProfileCubit.get(context).changeEnableEditing();

            },
            backgroundColor: AppColor.primary,
          );
        },
      ),
    );
  }
}
