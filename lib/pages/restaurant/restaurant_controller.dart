import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restoner_comensales/models/category.dart';
import 'package:restoner_comensales/models/restaurant.dart';

class RestaurantController extends GetxController with StateMixin<Restaurant> {
  var selectedCategory = 0.obs;
  var selectedDay = 'Sábado - 27/11'.obs;
  final scrollController = ScrollController();

  //var hasOrder = false.obs;

  final categories = List.generate(5, (index) => Category.random());
  var showCategories = false.obs;
  Category get currentCategory => categories[selectedCategory.value];

  void getRestaurant() {
    change(null, status: RxStatus.loading());
    // Call database
    1.seconds.delay().then((value) {
      final restaurant = Restaurant.random();
      change(restaurant, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  @override
  void onInit() {
    //setScreenColors(statusBar: Colors.transparent);
    getRestaurant();
    super.onInit();
  }
}
