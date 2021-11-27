import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:restoner_comensales/utils/ui_utils.dart';
import 'profile_controller.dart';
export 'profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.max, children: [
      const Text('Profile'),
      kSpacerY,
      IconButton(
        icon: const FaIcon(FontAwesomeIcons.signOutAlt),
        onPressed: () => controller.logOut(),
      )
    ]);
  }
}
