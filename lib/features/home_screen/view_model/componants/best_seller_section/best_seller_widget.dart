import 'package:book_store/core/utils/widgets/custom_text.dart';
import 'package:book_store/features/home_screen/model/best_seller_model/best_Seller_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerWidget extends StatelessWidget {
  const BestSellerWidget({super.key, required this.product});
   final Products product ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(.05),offset: Offset(0, 120.sp)),
                ]
                ),
                height: 150.h,
                width: 120.h,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(
                  product.image ?? '',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 5.h,
                left: 5.w,
                height: 25.h,
                width: 40.w,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(8.sp)),
                  width: 50.w,
                  height: 30.w,
                  child: CustomText(
                    text: '${product.discount??0}%',
                    textAlign: TextAlign.center,
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomText(
            text: product.name ?? '',
            fontSize: 8.sp,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
          ),
          CustomText(
            text: product.category??'',
            fontSize: 14.sp,
            textAlign: TextAlign.center,
            color: Colors.grey,
          ),
          CustomText(
            text: product.price ?? '',
            fontSize: 12.sp,
            textAlign: TextAlign.center,
            color: Colors.grey,
            textDecoration: TextDecoration.lineThrough,
          ),
          CustomText(
            text: product.priceAfterDiscount.toString(),
            fontSize: 14.sp,
            textAlign: TextAlign.center,
            color: Colors.cyan,
          ),
        ],
      ),
    );
  }
}
