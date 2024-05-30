import 'package:flutter/material.dart';
import 'package:movies_app/sections/home_section/widgets/categories_item.dart';

class Popular extends StatelessWidget {
  final int itemCount;
  const Popular({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return   GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return const CategoriesItem();
        });
  }
}
