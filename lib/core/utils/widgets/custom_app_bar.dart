import 'package:book_store/core/services/local/shared_helper.dart';
import 'package:book_store/core/services/local/shared_keys.dart';
import 'package:book_store/core/utils/widgets/custom_drawer.dart';
import 'package:book_store/core/utils/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          CustomText(text: 'Hi ${SharedPreference.getData(key: SharedPreferenceKey.name)}',fontSize: 16.sp,),
          CustomText(text: 'What are you reading today? ',color: Colors.grey,fontSize: 16.sp,),
        ],
      ),
      actions: [
        CircleAvatar(
          radius: 30,
          backgroundImage: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJfPib7CWEiNiu18DRUk_FDdZR0KNSI4oz_g&s').image,
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
