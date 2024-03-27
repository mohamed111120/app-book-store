import 'package:book_store/core/theme/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return ElevatedButton(
                  onPressed: () {
                    ThemeCubit.get(context).changeTheme();
                  },
                  child: Icon(ThemeCubit.get(context).isDark
                      ? Icons.dark_mode
                      : Icons.light_mode));
            },
          )
        ],
      ),
    );
  }
}
