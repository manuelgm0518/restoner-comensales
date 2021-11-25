import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:restoner_comensales/pages/home/home_controller.dart';
import 'package:restoner_comensales/utils/printer.dart';

class SearchController extends GetxController {
  final pageController = PageController(initialPage: 1);
  final refreshController = RefreshController();

  @override
  void onInit() {
    pageController.addListener(() {
      if (pageController.hasClients) {
        Get.find<HomeController>().hideBottomBar(pageController.page == 0.0);
      }
    });
    super.onInit();
  }

  void onRefresh() async {
    pageController.previousPage(duration: const Duration(seconds: 2), curve: ElasticOutCurve());
    refreshController.refreshCompleted();
  }

  // void _onLoading() async {
  //   // monitor network fetch
  //   await Future.delayed(Duration(milliseconds: 1000));
  //   // if failed,use loadFailed(),if no data return,use LoadNodata()
  //   items.add((items.length + 1).toString());
  //   if (mounted) setState(() {});
  //   _refreshController.loadComplete();
  // }

}
