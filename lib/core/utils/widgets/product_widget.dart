import 'package:book_store/features/cart/view_model/cart_cubit/cart_cubit.dart';
import 'package:book_store/features/favorites/view_model/favorites_cubit/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_text.dart';
import '../../../features/home_layout/model/ProductsDetails.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});

  final ProductsDetails product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(.7)),
        borderRadius: BorderRadius.circular(10.sp),
      ),
      padding: EdgeInsets.only(right: 5.w),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      width: double.infinity,
      height: 150.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(.05),
                          offset: Offset(0, 120.sp)),
                    ]),
                height: 150.h,
                width: 120.w,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(
                  product.image ??
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVGHL9r9OucwArH8yO3rEDPryG4V3tSCBw-w&s',
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
                    text: '${product.discount}%',
                    textAlign: TextAlign.center,
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 10.w,
          ),
          SizedBox(
            width: 120.w,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0.h),
              child: Column(
                children: [
                  CustomText(
                    overflow: TextOverflow.ellipsis,
                    text: product.name ?? 'Mohamed',
                    fontSize: 13.sp,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: product.id.toString(),
                    fontSize: 13.sp,
                    textAlign: TextAlign.center,
                    color: Colors.grey,
                  ),
                  CustomText(
                    text: product.price.toString(),
                    fontSize: 13.sp,
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
          ),
          SizedBox(
            width: 10.w,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    FavoritesCubit.get(context).addToFavorites(product.id);
                  },
                  child: Icon(Icons.favorite,),
                ),
                InkWell(
                  onTap: () {
                    CartCubit.get(context).addToCart(productId: product.id ?? 0);
                  },
                  child: Icon(Icons.shopping_cart),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
