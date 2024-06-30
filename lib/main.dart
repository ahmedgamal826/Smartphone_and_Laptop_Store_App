import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phones_and_laptops_store_app/Cubit/store_cubit.dart';
import 'package:phones_and_laptops_store_app/Screens/spalsh_screen.dart';

void main() {
  runApp(const Phones_Laptops_store_app());
}

class Phones_Laptops_store_app extends StatelessWidget {
  const Phones_Laptops_store_app({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
