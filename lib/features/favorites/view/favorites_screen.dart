import 'package:book_store/core/utils/widgets/product_widget.dart';
import 'package:book_store/features/favorites/view_model/favorites_cubit/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    FavoritesCubit.get(context).showFavorites();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
  builder: (context, state) {
    print(FavoritesCubit.get(context).favoritesBooks.length);
    return ListView.builder(
      itemCount:  FavoritesCubit.get(context).favoritesBooks.length,
      itemBuilder: (context, index) {
        return ProductWidget(product:  FavoritesCubit.get(context).favoritesBooks[index]);

      },
    );
  },
);
  }
}
