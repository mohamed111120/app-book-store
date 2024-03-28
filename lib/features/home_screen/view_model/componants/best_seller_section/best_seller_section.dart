import 'package:book_store/core/utils/widgets/custom_text.dart';
import 'package:book_store/features/home_screen/view_model/componants/best_seller_section/best_seller_listview.dart';
import 'package:book_store/features/home_screen/view_model/componants/best_seller_section/best_seller_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerSection extends StatelessWidget {
  const BestSellerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 10.h , horizontal: 15.w),
          child: Row(
            children: [
              Expanded(
                child: CustomText(text: 'Best Seller',fontSize: 20.sp,fontWeight: FontWeight.bold,)
              ),
              Icon(
                Icons.arrow_forward_outlined,
                size: 30.sp,
              ),
            ],
          ),
        ),
        BestSellerListView(),
      ],
    );
  }
}
