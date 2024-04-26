import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../view_model/home_cubits/best_seller_cubit/best_seller_cubit.dart';
import 'best_seller_widget.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerCubit, BestSellerState>(
      builder: (context, state) {
        return SizedBox(
          height: 230.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return BestSellerWidget(product: BestSellerCubit
                  .get(context)
                  .bestSellerList[index],);
            },
            separatorBuilder: (context, index) {
              return const SizedBox();
            },
            itemCount:  BestSellerCubit.get(context).bestSellerList.length,
          ),
        );
      },
    );
  }
}
