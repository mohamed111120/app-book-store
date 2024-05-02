import 'package:book_store/features/cart/view/widgets/cart_item.dart';
import 'package:book_store/features/cart/view_model/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    CartCubit.get(context).showCarts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: CartCubit
                  .get(context)
                  .cartProducts
                  .length,
              itemBuilder: (context, index) {
                return CartItem(cartModel: CartCubit.get(context).cartProducts[index],);
              },
            );
          },
        ));
  }
}
