import 'package:flutter/material.dart';

class CategoryButtons extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onCategorySelected;

  const CategoryButtons(
      {Key? key, required this.selectedIndex, required this.onCategorySelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _categoryButton('SmartPhones', 0, context),
        _categoryButton('Laptops', 1, context),
      ],
    );
  }

  Widget _categoryButton(String title, int index, BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            selectedIndex == index ? Colors.blue : Colors.grey),
      ),
      onPressed: () => onCategorySelected(index),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
