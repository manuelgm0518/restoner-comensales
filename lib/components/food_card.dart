import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:restoner_comensales/config/app_themes.dart';
import 'package:restoner_comensales/models/food.dart';
import 'package:restoner_comensales/utils/ui_utils.dart';

class FoodCard extends StatefulWidget {
  const FoodCard(this.food, {Key? key}) : super(key: key);
  final Food food;

  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  int selectedItems = 0;
  bool get hasSelection => selectedItems > 0;

  Widget _quantityButton({required IconData icon, required void Function() onPressed}) {
    return Container(
      decoration: BoxDecoration(
        color: hasSelection ? kPrimaryColor : kSurfaceColor,
        border: Border.all(color: kPrimaryColor, width: 2),
        borderRadius: kRoundedBorder / 2,
      ),
      width: 30,
      height: 30,
      alignment: Alignment.center,
      child: FaIcon(
        icon,
        color: hasSelection ? kSurfaceColor : kPrimaryColor,
        size: 18,
      ),
    ).mouse(() => onPressed());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kSurfaceColor,
        border: Border.all(color: kLightColor, width: 1),
        borderRadius: kRoundedBorder,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.min, children: [
        Image.network(widget.food.picture),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.min, children: [
          Text(widget.food.name, style: Get.textTheme.sub1),
          kSpacerY1,
          Text(NumberFormat.simpleCurrency().format(widget.food.price), style: Get.textTheme.semibold.copyWith(color: Colors.green)),
          Text('${widget.food.stock} unidades', textAlign: TextAlign.center, style: Get.textTheme.sub2.copyWith(color: kPrimaryColor)).py,
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            _quantityButton(
              icon: FontAwesomeIcons.minus,
              onPressed: () {
                setState(() => selectedItems = max(0, selectedItems - 1));
              },
            ),
            Text(selectedItems.toString(), textAlign: TextAlign.center, style: Get.textTheme.sub1).width(22).px,
            _quantityButton(
              icon: FontAwesomeIcons.plus,
              onPressed: () {
                setState(() => selectedItems = min(widget.food.stock, selectedItems + 1));
              },
            ),
          ]),
        ]).p3,
      ]),
    ).rounded();
  }
}
