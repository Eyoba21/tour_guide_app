import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/cubits/app_cubit.dart';
import 'package:myapp/cubits/app_cubits_states.dart';
import 'package:myapp/view/screens/details_screen.dart';
import 'package:myapp/view/screens/login_page.dart';
import 'package:myapp/view/screens/main_page.dart';
import 'package:myapp/view/screens/welcom_screen.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<Appcubits, CubitStates>(builder: (context, state) {
        try {
          if (state is WelcomeState) {
            return const WelcomScreen();
          }
          if (state is LoginState) {
            return LoginPage();
          }
          if (state is LoadedState) {
            return const MainPage();
          }
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: AppColors.mainTextColor,
              ),
            );
          }
          if (state is DetailState) {
            return DetailScreen();
          } else {
            return Container();
          }
        } catch (e) {
          e.toString();
          rethrow;
        }
      }),
    );
  }
}
