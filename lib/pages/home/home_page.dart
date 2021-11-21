import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restoner_comensales/utils/ui_utils.dart';
import 'package:unicons/unicons.dart';
import 'home_controller.dart';
export 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.min, children: [
        IconButton(
          icon: const Icon(UniconsLine.signout),
          color: Colors.black,
          onPressed: () => controller.logOut(),
        ).left([
          kSpacer,
          const Text('Salir'),
        ]),
        const Text('Home').expanded(),
      ]).p3,
    ).safeArea();
  }
}
