import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restoner_comensales/pages/home/search/search_controller.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  late final TabController tabController;
  var hideBottomBar = false.obs;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      if (tabController.index != 0 && Get.find<SearchController>().pageController.hasClients) {
        Get.find<SearchController>().pageController.jumpToPage(1);
      }
    });

    super.onInit();
  }
}
