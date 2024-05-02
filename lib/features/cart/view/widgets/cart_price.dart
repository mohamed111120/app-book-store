import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/widgets/custom_text.dart';

class CartPrice extends StatelessWidget {
  const CartPrice({super.key, required this.cartPriceAfterDiscount, required this.cartPrice});
  final double cartPriceAfterDiscount;
  final String cartPrice;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(text: '$cartPrice LE',color: Colors.grey,textDecoration: TextDecoration.lineThrough,fontSize: 16,),
        CustomText(text: '$cartPriceAfterDiscount LE',color: AppColor.primary,fontSize: 16,),
      ],
    );
  }
}
