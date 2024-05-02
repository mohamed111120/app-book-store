import 'package:book_store/core/utils/app_colors.dart';
import 'package:book_store/core/utils/widgets/custom_text.dart';
import 'package:book_store/features/cart/model/cart_model.dart';
import 'package:book_store/features/cart/view/widgets/cart_image.dart';
import 'package:book_store/features/cart/view/widgets/cart_price.dart';
import 'package:book_store/features/cart/view/widgets/update_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartModel});
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      height: 155.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(.5)),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          CartImage(image: cartModel.itemProductImage ?? '',),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Text(
                        cartModel.itemProductName??'',
                        style: TextStyle(color: Colors.grey, fontSize: 18.sp),
                      ),
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      UpdateCart(itemQuantity: cartModel.itemQuantity??0,),
                      CartPrice(
                        cartPrice: cartModel.itemProductPrice ??'',
                        cartPriceAfterDiscount: cartModel.itemProductPriceAfterDiscount ?? 0.0,

                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
