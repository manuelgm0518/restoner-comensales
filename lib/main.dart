import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restoner_comensales/providers/session_provider.dart';
import 'config/app_pages.dart';
import 'config/app_themes.dart';
import 'services/session_service.dart';
import 'utils/ui_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initServices();
  //setScreenColors(statusBar: kPrimaryColor.variants.light, navigationBar: kSecondaryColor);
  runApp(const RestonerComensales());
}

Future<void> initServices() async {
  await GetStorage.init();
  await Get.putAsync(() => SessionService().init());
  Get.put(SessionProvider());
  // await Get.putAsync(() => RepositoryService().init());
}

class RestonerComensales extends StatelessWidget {
  const RestonerComensales({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.main,
        getPages: AppPages.routes,
        initialRoute: SessionService.to.loggedIn ? Routes.HOME : Routes.LOG_IN,
      ),
    );
  }
}
