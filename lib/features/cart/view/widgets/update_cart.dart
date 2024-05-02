import 'package:book_store/features/cart/view_model/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/widgets/custom_toast.dart';

class UpdateCart extends StatelessWidget {
  const UpdateCart(
      {super.key, required this.itemQuantity, required this.cartItemId});

  final int itemQuantity;

  final int cartItemId;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(.5), width: 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              CartCubit.get(context).updateCart(
                cartItemId: cartItemId,
                quantity: itemQuantity + 1,
              );
            },
            child: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
          Text(
            itemQuantity.toString(),
            style: TextStyle(fontSize: 22),
          ),
          InkWell(
            onTap: () {
              if (itemQuantity > 1) {
                CartCubit.get(context).updateCart(
                  cartItemId: cartItemId,
                  quantity: itemQuantity - 1,
                );
              }else{
                showToast(message: 'Can\'t be Less Than 1 Book', state: ToastState.warning);
              }
            },
            child: Icon(
              Icons.remove,
              color: itemQuantity == 1
                  ? Colors.grey.withOpacity(.5)
                  : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
