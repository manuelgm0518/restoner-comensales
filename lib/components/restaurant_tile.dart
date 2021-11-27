import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:restoner_comensales/config/app_pages.dart';
import 'package:restoner_comensales/config/app_themes.dart';
import 'package:restoner_comensales/models/restaurant.dart';
import 'package:restoner_comensales/utils/ui_utils.dart';

class RestaurantTile extends StatelessWidget {
  const RestaurantTile(this.restaurant, {Key? key}) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kSpacing2, vertical: kSpacing1),
      padding: kPadding2,
      decoration: BoxDecoration(
        color: kSurfaceColor,
        borderRadius: kRoundedBorder,
        border: Border.all(color: kLightColor),
      ),
      child: Row(children: [
        Container(
          width: 90,
          height: 90,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: restaurant.opened ? kPrimaryColor : kDarkColor, borderRadius: kRoundedBorder),
          child: FaIcon(restaurant.opened ? FontAwesomeIcons.storeAlt : FontAwesomeIcons.storeAltSlash, color: Colors.white),
        ),
        kSpacerX,
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(restaurant.name, overflow: TextOverflow.ellipsis, style: Get.textTheme.sub1),
          kSpacer,
          Text(restaurant.foodTypes.join(', '), overflow: TextOverflow.ellipsis, style: Get.textTheme.normal.copyWith(color: kDarkColor)),
          kSpacer,
          Container(
            padding: kPadding1,
            decoration: const BoxDecoration(borderRadius: kRoundedBorder, color: kBackgroundColor),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              FaIcon(FontAwesomeIcons.utensils, color: restaurant.hasLocalAttendance ? kLightColor : kSecondaryColor).box(35, 35),
              kSpacerX2,
              FaIcon(FontAwesomeIcons.bicycle, color: restaurant.hasDelivery ? kLightColor : kSecondaryColor).box(35, 35),
              kSpacerX2,
              FaIcon(FontAwesomeIcons.shoppingBag, color: restaurant.hasTakeout ? kLightColor : kSecondaryColor).box(35, 35),
            ]),
          ).aligned(Alignment.centerRight),
        ]).expanded(),
      ]).height(90),
    ).mouse(() => Get.toNamed(Routes.RESTAURANT(restaurant.id.toString())));
  }
}
