import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restoner_comensales/utils/ui_utils.dart';
import 'business_search_controller.dart';

class BusinessSearchView extends GetView<BusinessSearchController> {
  const BusinessSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Business search').centered(),
    );
  }
}
