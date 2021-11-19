import 'package:get/get.dart';
import 'package:restoner_comensales/config/app_pages.dart';

class SignUpController extends GetxController {
  var currentStep = 1.obs;

  void nextStep() {
    if (currentStep.value == 3) {
      Get.offAllNamed(Routes.HOME);
    } else {
      currentStep.value++;
    }
  }
}
