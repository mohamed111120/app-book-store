import 'package:book_store/core/utils/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../view_model/home_cubits/best_seller_cubit/best_seller_cubit.dart';
import 'best_seller_listview.dart';

class BestSellerSection extends StatefulWidget {
  const BestSellerSection({super.key});

  @override
  State<BestSellerSection> createState() => _BestSellerSectionState();
}

class _BestSellerSectionState extends State<BestSellerSection> {
  @override
  void initState() {
    if(BestSellerCubit.get(context).bestSellerList.isEmpty) {
      BestSellerCubit.get(context).getBestSellerProducts();
    }
    super.initState();
  }
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
        const BestSellerListView(),
      ],
    );
  }
}
