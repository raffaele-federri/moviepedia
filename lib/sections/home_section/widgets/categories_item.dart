import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_utils.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        borderRadius: AppUtils.kBorderRadius12,
        color: Colors.amber,
      ),
      height: 70,
      width: 50,
    );
  }
}
