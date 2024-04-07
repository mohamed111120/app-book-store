import 'package:book_store/features/home_screen/view_model/home_cubits/new_arrivals_cubit/new_arrivals_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'new_arrivals_widget.dart';

class NewArrivalsListView extends StatefulWidget {
  const NewArrivalsListView({super.key});

  @override
  State<NewArrivalsListView> createState() => _NewArrivalsListViewState();
}

class _NewArrivalsListViewState extends State<NewArrivalsListView> {

    @override
  void initState() {
    NewArrivalsCubit.get(context).getNewArrivalsProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewArrivalsCubit, NewArrivalsState>(
      builder: (context, state) {
        return SizedBox(
          height: 230.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return NewArrivalsWidget(product: NewArrivalsCubit.get(context).newArrivalsList[index]);
            },
            separatorBuilder: (context, index) {
              return const SizedBox();
            },
            itemCount: NewArrivalsCubit.get(context).newArrivalsList.length,
          ),
        );
      },
    );
  }
}
