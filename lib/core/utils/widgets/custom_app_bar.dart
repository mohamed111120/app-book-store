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
          CustomText(text: 'Hi ${SharedPreference.getData(key: SharedPreferenceKey.name)}'),
          CustomText(text: 'What are you reading today? ',color: Colors.grey,),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(
        double.maxFinite,
        70.h,
      );
}
