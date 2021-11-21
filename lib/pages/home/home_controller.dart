import 'package:get/get.dart';
import 'package:restoner_comensales/config/app_pages.dart';
import 'package:restoner_comensales/services/session_service.dart';

class HomeController extends GetxController {
  var loading = false.obs;
  Future<void> logOut() async {
    loading(true);
    await SessionService.to.logOut();
    Get.offAllNamed(Routes.LOG_IN);
    loading(false);
  }
}
