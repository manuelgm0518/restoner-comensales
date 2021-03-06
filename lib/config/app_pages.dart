// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:get/get.dart';
import 'package:restoner_comensales/pages/home/home_page.dart';
import 'package:restoner_comensales/pages/home/profile/profile_view.dart';
import 'package:restoner_comensales/pages/home/search/search_view.dart';
import 'package:restoner_comensales/pages/login/login_page.dart';
import 'package:restoner_comensales/pages/restaurant/restaurant_page.dart';
import 'package:restoner_comensales/pages/signup/signup_page.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.LOG_IN,
      page: () => const LogInPage(),
      binding: BindingsBuilder<dynamic>(() {
        Get.put<LogInController>(LogInController());
      }),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => const SignUpPage(),
      binding: BindingsBuilder<dynamic>(() {
        Get.put<SignUpController>(SignUpController());
      }),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: BindingsBuilder<dynamic>(() {
        Get.put<HomeController>(HomeController());
        Get.put<SearchController>(SearchController());
        Get.put<ProfileController>(ProfileController());
      }),
    ),
    GetPage(
      name: Routes.RESTAURANT(':id'),
      page: () => const RestaurantPage(),
      binding: BindingsBuilder<dynamic>(() {
        Get.put<RestaurantController>(RestaurantController());
      }),
    ),
  ];
}

abstract class Routes {
  static const HOME = '/';
  static const LOG_IN = '/login';
  static const SIGN_UP = '/signup';
  static String RESTAURANT(String id) => '/restaurant/$id';
}
