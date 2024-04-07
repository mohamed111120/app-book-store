import 'package:book_store/features/single_category/model/single_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/custom_text.dart';

class SingleCategoryWidget extends StatelessWidget {
  const SingleCategoryWidget({super.key, required this.categoryProducts});
final  CategoryProducts categoryProducts;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(.7)),
        borderRadius: BorderRadius.circular(10.sp),
      ),
      padding: EdgeInsets.all(10.sp),
      margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
      width: double.infinity,
      height: 150.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(10.sp),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(.05),
                          offset: Offset(0, 120.sp)),
                    ]),
                height: 150.h,
                width: 120.w,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(
                  categoryProducts.image ??'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVGHL9r9OucwArH8yO3rEDPryG4V3tSCBw-w&s',
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
                      borderRadius:
                      BorderRadius.circular(8.sp)),
                  width: 50.w,
                  height: 30.w,
                  child: CustomText(
                    text: '${100.toInt()}%',
                    textAlign: TextAlign.center,
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 20.w,
          ),
          SizedBox(
            width: 120.w,
            child: Column(
              children: [
                CustomText(
                    overflow: TextOverflow.ellipsis,
                  text: categoryProducts.name ?? 'Mohamed',
                  fontSize: 12.sp,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  text: categoryProducts.id.toString() ,
                  fontSize: 12.sp,
                  textAlign: TextAlign.center,
                  color: Colors.grey,
                ),
                CustomText(
                  text: categoryProducts.price.toString(),
                  fontSize: 12.sp,
                  textAlign: TextAlign.center,
                  color: Colors.grey,
                  textDecoration: TextDecoration.lineThrough,
                ),
                CustomText(
                  text: categoryProducts.priceAfterDiscount.toString(),
                  fontSize: 14.sp,
                  textAlign: TextAlign.center,
                  color: Colors.cyan,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.favorite),
                Icon(Icons.shopping_cart),
              ],
            ),
          )
        ],
      ),
    );
  }
}
