import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:restoner_comensales/components/restaurant_tile.dart';
import 'package:restoner_comensales/config/app_themes.dart';
import 'package:restoner_comensales/models/restaurant.dart';
import 'package:restoner_comensales/utils/ui_utils.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'search_controller.dart';
export 'search_controller.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: PageView(
        controller: controller.pageController,
        scrollDirection: Axis.vertical,
        children: const [
          _SearchMapView(),
          _SearchListView(),
        ],
      ),
    );
  }
}

class _SearchListView extends GetView<SearchController> {
  const _SearchListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      physics: kBouncyScroll,
      controller: controller.refreshController,
      onRefresh: controller.onRefresh,
      header: ClassicHeader(
        completeDuration: 0.seconds,
        refreshStyle: RefreshStyle.UnFollow,
        idleText: 'Mostrar mapa',
        releaseText: 'Mostrar mapa',
        completeText: 'Mostrar mapa',
        idleIcon: const Icon(FontAwesomeIcons.mapMarkedAlt, color: kPrimaryColor),
        releaseIcon: const Icon(FontAwesomeIcons.mapMarkedAlt, color: kPrimaryColor),
        completeIcon: const Icon(FontAwesomeIcons.mapMarkedAlt, color: kPrimaryColor),
        textStyle: Get.textTheme.button!.copyWith(color: kPrimaryColor),
      ),
      child: LiveList(
        itemCount: 10,
        shrinkWrap: true,
        physics: kBouncyScroll,
        showItemDuration: 150.milliseconds,
        showItemInterval: 50.milliseconds,
        itemBuilder: (context, index, animation) {
          return FadeTransition(
            opacity: Tween<double>(begin: 0, end: 1).animate(animation),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, -0.1),
                end: Offset.zero,
              ).animate(animation),
              child: RestaurantTile(Restaurant.random()),
            ),
          );
        },
      ),
    );
  }
}

class _SearchMapView extends GetView<SearchController> {
  const _SearchMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned.fill(
        child: Container(
          alignment: Alignment.center,
          color: Colors.red,
          child: const Text('Mapa'),
        ),
      ),
      ScrollSnapList(
        onItemFocus: (index) {},
        itemSize: Get.width,
        scrollPhysics: kBouncyScroll,
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return RestaurantTile(
            Restaurant.random(),
          ).width(Get.width).aligned(Alignment.bottomCenter);
        },
      ).height(120).aligned(Alignment.bottomCenter),
    ]);
  }
}
