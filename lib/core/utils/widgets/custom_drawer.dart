import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/theme_cubit/theme_cubit.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
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
