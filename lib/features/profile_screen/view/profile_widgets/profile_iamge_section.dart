import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.maxFinite,
          height: 80.h,
          decoration: BoxDecoration(
            color: AppColor.primary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(200.sp, 80.sp),
              bottomRight: Radius.elliptical(200.sp, 80.sp),
            ),
          ),
        ),
        Positioned(
          bottom: -25,
          child: CircleAvatar(
            radius: 53.sp,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 50.sp,
              backgroundImage: const NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJfPib7CWEiNiu18DRUk_FDdZR0KNSI4oz_g&s'),
            ),
          ),
        ),
      ],
    );
  }
}
