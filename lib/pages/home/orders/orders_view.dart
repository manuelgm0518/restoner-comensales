import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restoner_comensales/utils/ui_utils.dart';
import 'orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Orders').centered(),
    );
  }
}
