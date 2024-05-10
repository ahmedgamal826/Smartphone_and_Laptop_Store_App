import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phones_and_laptops_store_app/Cubit/store_cubit.dart';
import 'package:phones_and_laptops_store_app/widgets/category_buttons.dart';
import 'package:phones_and_laptops_store_app/widgets/header.dart';
import 'package:phones_and_laptops_store_app/widgets/product_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final StoreCubit storeCubit = BlocProvider.of<StoreCubit>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 25),
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: 20),
            const Row(
              children: [
                Text(
                  'Category',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CategoryButtons(
                selectedIndex: selectedIndex,
                onCategorySelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                  final category = index == 0 ? 'smartphones' : 'laptops';
                  storeCubit.fetchData(category);
                }),
            ProductGrid(selectedIndex: selectedIndex),
          ],
        ),
      ),
    );
  }
}
