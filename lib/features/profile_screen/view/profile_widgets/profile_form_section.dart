import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/custom_text_form_field.dart';
import '../../view_model/profile_cubit/profile_cubit.dart';

class ProfileFormSection extends StatelessWidget {
  const ProfileFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.sp),
      child: Container(
        padding: EdgeInsets.all(15.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: Colors.grey.withOpacity(.1),
        ),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return Form(

              child: Column(
                children: [
                  CustomTextFormField(
                    enabled: ProfileCubit.get(context).enableEditing,
                    controller: ProfileCubit.get(context).nameController,
                    lable: 'name',
                    prefixIcon: const Icon(Icons.person),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    enabled: ProfileCubit.get(context).enableEditing,
                    controller: ProfileCubit.get(context).emilController,
                    lable: 'email',
                    prefixIcon: const Icon(Icons.email),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    enabled: ProfileCubit.get(context).enableEditing,
                    controller: ProfileCubit.get(context).phoneController,
                    lable: 'phone',
                    prefixIcon: const Icon(Icons.phone),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    enabled: ProfileCubit.get(context).enableEditing,
                    controller: ProfileCubit.get(context).cityController,
                    lable: 'city',
                    prefixIcon: const Icon(Icons.location_city),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    enabled: ProfileCubit.get(context).enableEditing,
                    controller: ProfileCubit.get(context).addressController,
                    lable: 'address',
                    prefixIcon: const Icon(Icons.location_on),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
