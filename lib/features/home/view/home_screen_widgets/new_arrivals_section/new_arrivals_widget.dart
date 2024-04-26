import 'package:book_store/core/utils/widgets/custom_text.dart';
import 'package:book_store/features/home_layout/model/ProductsDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class NewArrivalsWidget extends StatelessWidget {
  const NewArrivalsWidget({super.key, required this.product});
  final ProductsDetails product ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: SizedBox(
        width: 120.w,

        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.withOpacity(.05),offset: Offset(0, 120.sp)),
                        ]
                    ),
                    height: 150.h,
                    width: 120.w,
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
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomText(
              text: product.name ?? '',
              fontSize: 14.sp,
              textAlign: TextAlign.center,
              maxLines: 2,
              fontWeight: FontWeight.bold,
            ),
            CustomText(
              text: product.category??'',
              fontSize: 12.sp,
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
      ),
    );
  }
}
