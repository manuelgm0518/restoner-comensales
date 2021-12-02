import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restoner_comensales/config/app_themes.dart';
import 'package:restoner_comensales/models/category.dart';
import 'package:restoner_comensales/utils/ui_utils.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(this.category, {Key? key}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: kRoundedBorder,
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: const ColorFilter.mode(Colors.black45, BlendMode.darken),
          image: NetworkImage(category.picture),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        category.name,
        textAlign: TextAlign.center,
        style: Get.textTheme.semibold.copyWith(color: Colors.white),
      ),
    );
  }
}
