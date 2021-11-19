import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restoner_comensales/utils/ui_utils.dart';
import 'profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Profile').centered(),
    );
  }
}
