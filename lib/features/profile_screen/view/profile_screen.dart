import 'package:book_store/features/profile_screen/view/profile_widgets/profile_form_section.dart';
import 'package:book_store/features/profile_screen/view_model/profile_cubit/profile_cubit.dart';
import 'package:book_store/features/profile_screen/view/profile_widgets/profile_button.dart';
import 'package:book_store/features/profile_screen/view/profile_widgets/profile_iamge_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    ProfileCubit.get(context).showProfileDAta();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProfileImageSection(),
          SizedBox(height: 10.h,),

          const ProfileFormSection(),
          SizedBox(height: 10.h,),
          const ProfileButton(),
        ],
      ),
    );
  }
}
