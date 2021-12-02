import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:collapsible/collapsible.dart';
import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:restoner_comensales/config/app_themes.dart';
import 'package:restoner_comensales/models/foodtype.dart';
import 'package:restoner_comensales/pages/home/orders/orders_view.dart';
import 'package:restoner_comensales/pages/home/profile/profile_view.dart';
import 'package:restoner_comensales/pages/home/search/search_view.dart';
import 'package:restoner_comensales/utils/ui_utils.dart';
import 'home_controller.dart';
export 'home_controller.dart';

//const _kBottomBarHeight = 56.0;

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSurfaceColor,
        title: const Text('Restoner', style: TextStyle(fontSize: 35)),
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.filter),
            onPressed: () {},
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            height: kToolbarHeight,
            color: kSurfaceColor,
            alignment: Alignment.center,
            child: Row(children: [
              ListView.builder(
                itemCount: FoodType.types.length,
                shrinkWrap: true,
                physics: kBouncyScroll,
                padding: kPaddingX,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final foodType = FoodType.types[index];
                  return SizedBox(
                    width: kToolbarHeight,
                    height: kToolbarHeight,
                    child: Text(
                      foodType,
                      style: Get.textTheme.info.copyWith(color: kDarkColor),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ).top([
                      const FaIcon(FontAwesomeIcons.hamburger, color: kDarkColor, size: 20).pb1,
                    ], crossAxisAlignment: CrossAxisAlignment.center),
                  ).p2;
                },
              ).expanded(),
              Container(color: kLightColor, width: 1, height: 30),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.plusCircle),
                onPressed: () {},
              ),
            ]),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: const [
          SearchView(),
          OrdersView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => AnimatedSizeAndFade(
          alignment: Alignment.bottomCenter,
          sizeCurve: Curves.decelerate,
          child: controller.hideBottomBar.value
              ? Container(
                  color: kSurfaceColor,
                  width: Get.width,
                  height: 40,
                  alignment: Alignment.center,
                  child: Container(width: 100, height: 6, decoration: const BoxDecoration(color: kSecondaryColor, borderRadius: kRoundedBorder)),
                )
              : Container(
                  color: kSurfaceColor,
                  child: TabBar(
                    controller: controller.tabController,
                    labelColor: kPrimaryColor,
                    unselectedLabelColor: kDarkColor,
                    indicatorPadding: kPaddingX3,
                    indicator: const BoxDecoration(border: Border(top: BorderSide(color: kPrimaryColor, width: 2))),
                    tabs: const [
                      Tab(icon: FaIcon(FontAwesomeIcons.home)),
                      Tab(icon: FaIcon(FontAwesomeIcons.bars)),
                      Tab(icon: FaIcon(FontAwesomeIcons.solidChartBar)),
                    ],
                  ),
                ),
        ),
      ),
      // bottomNavigationBar: Obx(
      //   () => Collapsible(
      //     alignment: Alignment.bottomCenter,
      //     collapsed: controller.hideBottomBar.value,
      //     axis: CollapsibleAxis.vertical,
      //     maintainState: true,
      //     maintainAnimation: true,
      //     child: Container(
      //       color: kSurfaceColor,
      //       child: TabBar(
      //         controller: controller.tabController,
      //         labelColor: kPrimaryColor,
      //         unselectedLabelColor: kDarkColor,
      //         indicatorPadding: kPaddingX3,
      //         indicator: const BoxDecoration(border: Border(top: BorderSide(color: kPrimaryColor, width: 2))),
      //         tabs: const [
      //           Tab(icon: FaIcon(FontAwesomeIcons.home)),
      //           Tab(icon: FaIcon(FontAwesomeIcons.bars)),
      //           Tab(icon: FaIcon(FontAwesomeIcons.solidChartBar)),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    ).overlayStyle(statusBar: kSurfaceColor, navigationBar: kSurfaceColor); //.safeArea();
  }

  // Widget get _bottomNavBar {
  //   return SizedBox(
  //     height: _kBottomBarHeight,
  //     child: BottomNavigationBar(
  //       backgroundColor: Colors.amber[800],
  //       items: [
  //         BottomNavigationBarItem(icon: FaIcon(Icons.call), label: 'Call'),
  //         BottomNavigationBarItem(icon: FaIcon(Icons.message), label: 'Message'),
  //       ],
  //     ),
  //   );
  // }
}
