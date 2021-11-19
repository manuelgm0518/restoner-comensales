import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restoner_comensales/config/app_pages.dart';
import 'package:restoner_comensales/config/app_themes.dart';
import 'package:restoner_comensales/services/session_service.dart';
import 'package:restoner_comensales/utils/ui_utils.dart';

class LogInController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final phoneField = TextEditingController();
  final passwordField = TextEditingController();
  var country = 52.obs;

  var loggingIn = false.obs;
  Future<void> logIn() async {
    if (formKey.currentState?.validate() ?? false) {
      loggingIn(true);
      if (await SessionService.to.logIn(
        country: country.value,
        phone: int.tryParse(phoneField.text) ?? 0,
        password: passwordField.text,
      )) Get.offAllNamed(Routes.HOME);
      loggingIn(false);
    }
  }

  @override
  void onInit() {
    setScreenColors(statusBar: kBackgroundColor, navigationBar: kBackgroundColor);
    super.onInit();
  }
}
