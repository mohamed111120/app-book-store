import 'package:book_store/features/home_screen/view_model/componants/best_seller_section/best_seller_widget.dart';
import 'package:book_store/features/home_screen/view_model/home_cubits/best_seller_cubit/best_seller_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerListView extends StatefulWidget {
  const BestSellerListView({super.key});

  @override
  State<BestSellerListView> createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {

  @override
  void initState() {
    BestSellerCubit.get(context).getBestSellerProducts();
    super.initState();
  }
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
              return SizedBox();
            },
            itemCount:  BestSellerCubit.get(context).bestSellerList.length,
          ),
        );
      },
    );
  }
}
