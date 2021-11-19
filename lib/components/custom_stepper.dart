import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restoner_comensales/config/app_themes.dart';
import 'package:restoner_comensales/utils/ui_utils.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({Key? key, required this.steps, this.selectedStep = 1})
      : assert(selectedStep > 0 && selectedStep <= steps),
        super(key: key);

  final int steps;
  final int selectedStep;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: [
        for (int i = 1; i <= steps; i++) ...[
          Container(
            decoration: BoxDecoration(color: selectedStep >= i ? kPrimaryColor : kSurfaceColor, border: Border.all(color: kPrimaryColor, width: 2), shape: BoxShape.circle),
            alignment: Alignment.center,
            padding: kPadding2,
            child: Text(
              i.toString(),
              style: Get.textTheme.sub2.copyWith(color: selectedStep >= i ? kSurfaceColor : kPrimaryColor),
            ),
          ),
          if (i < steps) Container(height: 2, color: kPrimaryColor).expanded()
        ]
      ]).pxy(3, 2),
    );
  }
}
