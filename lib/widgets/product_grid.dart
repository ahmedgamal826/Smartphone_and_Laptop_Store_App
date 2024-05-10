import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phones_and_laptops_store_app/Cubit/store_cubit.dart';
import 'package:phones_and_laptops_store_app/Cubit/store_states.dart';
import 'package:phones_and_laptops_store_app/Model/store_model.dart';
import 'package:phones_and_laptops_store_app/Screens/detailed_screen.dart';

class ProductGrid extends StatefulWidget {
  final int selectedIndex;

  const ProductGrid({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  Map<int, bool> favorites = {};

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<StoreCubit, StoreStates>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SuccessState) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7,
                mainAxisSpacing: 20,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final StoreModel storeModel = state.products[index];
                // Ensure there is a boolean value for each product
                favorites[storeModel.id] = favorites[storeModel.id] ?? false;
                return _buildProductCard(storeModel, context);
              },
            );
          } else if (state is ErrorState) {
            return Text(state.message);
          }
          return const Center(child: Text('Please choose a category'));
        },
      ),
    );
  }

  Widget _buildProductCard(StoreModel storeModel, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => DetailedScreen(storeModel: storeModel)),
        );
      },
      child: Stack(
        children: <Widget>[
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              children: [
                SizedBox(
                  width: 200,
                  height: 150,
                  child: Image.network(
                    storeModel.thumbnail,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(10),
          ),
          Positioned(
            bottom: 10,
            left: 18,
            child: SizedBox(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    storeModel.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$" + storeModel.price.toString(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              // Toggle the favorite status
                              favorites[storeModel.id] =
                                  !favorites[storeModel.id]!;
                            });
                          },
                          icon: Icon(
                            Icons.favorite,
                            size: 30,
                            color: favorites[storeModel.id]!
                                ? Colors.red
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
