import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restoner_comensales/config/app_settings.dart';
import 'package:restoner_comensales/providers/session_provider.dart';
import 'package:restoner_comensales/utils/printer.dart';

class SessionService extends GetxService {
  static SessionService get to => Get.find();
  String? user;
  bool get loggedIn => user != null;

  Future<SessionService> init() async {
    user = GetStorage().read<String>(AppSettings.storageUserToken);
    return this;
  }

  Future<bool> logIn({required int country, required int phone, required String password}) async {
    final res = await SessionProvider.to.logIn(phone: phone, country: country, password: password);
    if (res.error) {
      Printer.error(res.dataError);
      return false;
    } else {
      await GetStorage().write(AppSettings.storageUserToken, res.data);
      user = res.data;
      return true;
    }
  }

  Future<void> logOut() async {
    await GetStorage().remove(AppSettings.storageUserToken);
    user = null;
  }
}
