import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restoner_comensales/utils/ui_utils.dart';
import 'home_controller.dart';
export 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Text('Home').centered(),
      ),
    );
  }
}
