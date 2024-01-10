import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/cubits/app_cubit.dart';
import 'package:myapp/cubits/app_cubit_logics.dart';
import 'package:myapp/services/data_services.dart';
void main() => runApp(const Myapp());

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<Appcubits>(
        create: (context) => Appcubits(DataServices(),),
        child: const AppCubitLogics(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
