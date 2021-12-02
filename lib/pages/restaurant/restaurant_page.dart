import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:restoner_comensales/components/category_card.dart';
import 'package:restoner_comensales/components/food_card.dart';
import 'package:restoner_comensales/config/app_themes.dart';
import 'package:restoner_comensales/models/food.dart';
import 'package:restoner_comensales/utils/ui_utils.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';
import 'restaurant_controller.dart';
export 'restaurant_controller.dart';

const _kExpandedHeaderHeight = 190.0;
const _kWeekdays = ['L', 'M', 'M', 'J', 'V', 'S', 'D'];

class RestaurantPage extends GetView<RestaurantController> {
  const RestaurantPage({Key? key}) : super(key: key);

  Widget _iconButton({required IconData icon, required void Function() onPressed, Color iconColor = kSecondaryColor}) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(color: kSurfaceColor, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: FaIcon(
        icon,
        color: iconColor,
        size: 22,
      ),
    ).mouse(onPressed);
  }

  @override
  Widget build(BuildContext context) {
    return DirectSelectContainer(
      child: Scaffold(
        body: AnimatedSizeAndFade(
          child: controller.stateBuilder(
            animatedSwitch: true,
            widget: (state) {
              return CustomScrollView(
                physics: kBouncyScroll,
                controller: controller.scrollController,
                slivers: <Widget>[
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: FlexibleHeaderDelegate(
                      collapsedElevation: 0,
                      statusBarHeight: MediaQuery.of(context).padding.top,
                      expandedHeight: _kExpandedHeaderHeight,
                      backgroundColor: Colors.transparent,
                      background: MutableBackground(
                        collapsedColor: kSurfaceColor,
                        expandedWidget: Stack(children: [
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.77), BlendMode.dstATop),
                                  image: const AssetImage('assets/pictures/restaurant.jpg'),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(color: state!.opened ? kSuccessColor : kErrorColor, borderRadius: kRoundedBorder / 2),
                            padding: kPadding2,
                            margin: kPadding,
                            child: Text(
                              state.opened ? 'ABIERTO' : 'CERRADO',
                              style: Get.textTheme.semibold.copyWith(color: Colors.white),
                            ),
                          ).aligned(Alignment.bottomCenter),
                        ]),
                      ),
                      leading: _iconButton(
                        icon: FontAwesomeIcons.chevronLeft,
                        onPressed: () => Get.back(),
                      ).pl,
                      actions: [
                        ValueBuilder<bool?>(
                          initialValue: false,
                          builder: (value, update) => _iconButton(
                            icon: value! ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                            iconColor: value ? Colors.red : kSecondaryColor,
                            onPressed: () => update(!value),
                          ),
                        ).pr
                      ],
                      children: [
                        // FlexibleHeaderItem(
                        //     options: [HeaderItemOptions.hide],
                        //     expandedAlignment: Alignment.topRight,
                        //     expandedMargin: kPaddingX5,
                        //     child: Container(
                        //       decoration: BoxDecoration(color: state!.opened ? kSuccessColor : kErrorColor, borderRadius: kRoundedBorder / 2),
                        //       padding: kPadding2,
                        //       margin: kPadding,
                        //       child: Text(
                        //         state.opened ? 'ABIERTO' : 'CERRADO',
                        //         style: Get.textTheme.semibold.copyWith(color: Colors.white),
                        //       ),
                        //     )),
                        FlexibleTextItem(
                          text: state.name,
                          textAlign: TextAlign.center,
                          collapsedStyle: Get.textTheme.sub2.copyWith(color: kSecondaryColor),
                          expandedStyle: Get.textTheme.title.copyWith(color: kSurfaceColor),
                          expandedAlignment: Alignment.bottomCenter,
                          collapsedAlignment: Alignment.center,
                          expandedPadding: kPadding,
                          expandedMargin: kPaddingB5,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 2,
                          collapsedMargin: kPaddingX5,
                          collapsedPadding: kPaddingX5,
                          //expandedMargin: EdgeInsets.fromLTRB(0, 0, 0, kSpacing5),
                        ),
                      ],
                    ),
                  ),

                  // SliverAppBar(
                  //   pinned: true,
                  //   //snap: true,
                  //   floating: true,
                  //   backgroundColor: kSecondaryColor,
                  //   expandedHeight: 180.0,

                  //   //title: Text(state!.name),
                  //   leadingWidth: 40 + kSpacing,
                  //   leading: Container(
                  //     width: 40,
                  //     height: 40,
                  //     decoration: const BoxDecoration(color: kSurfaceColor, shape: BoxShape.circle),
                  //     alignment: Alignment.center,
                  //     child: const FaIcon(
                  //       FontAwesomeIcons.chevronLeft,
                  //       color: kSecondaryColor,
                  //       size: 20,
                  //     ),
                  //   ).mouse(() => Get.back()).pl,
                  //   actions: [
                  //     ValueBuilder<bool?>(
                  //       initialValue: false,
                  //       builder: (value, update) {
                  //         return Container(
                  //           width: 40,
                  //           height: 40,
                  //           decoration: const BoxDecoration(color: kSurfaceColor, shape: BoxShape.circle),
                  //           alignment: Alignment.center,
                  //           child: FaIcon(
                  //             value! ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                  //             color: value ? Colors.red : kSecondaryColor,
                  //             size: 20,
                  //           ),
                  //         ).mouse(() => update(!value));
                  //       },
                  //     ).pr,
                  //   ],
                  //   // flexibleSpace: CustomizableSpaceBar(
                  //   //   builder: (context, scrollingRate) {
                  //   //     /// Example content
                  //   //     return Padding(
                  //   //       padding: EdgeInsets.only(bottom: 10, left: 30 + 40 * scrollingRate),
                  //   //       child: Align(
                  //   //         alignment: Alignment.bottomLeft,
                  //   //         child: Text(
                  //   //           state!.name,
                  //   //           style: Get.textTheme.title.copyWith(fontSize: 42 - 15 * scrollingRate, color: kSurfaceColor, height: 1.2),
                  //   //         ),
                  //   //       ),
                  //   //     );
                  //   //   },
                  //   // ),
                  //   flexibleSpace: FlexibleSpaceBar(
                  //     title: Text(state!.name, style: Get.textTheme.title),
                  //     background: Stack(children: [
                  //       Image.asset('assets/pictures/restaurant.jpg', fit: BoxFit.cover, height: 180),
                  //       Container(
                  //         height: 180,
                  //         decoration: const BoxDecoration(
                  //           //color: const Color(0xff7c94b6),
                  //           gradient: LinearGradient(begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter, colors: [
                  //             Colors.black,
                  //             Colors.transparent,
                  //           ], stops: [
                  //             0.0,
                  //             1.0
                  //           ]),
                  //         ),
                  //       ),
                  //     ]),
                  //   ),
                  // ),

                  SliverStickyHeader(
                    header: Container(
                      padding: kPadding,
                      decoration: const BoxDecoration(color: kSurfaceColor, border: Border(bottom: BorderSide(color: kLightColor, width: 1))),
                      child: Row(children: [
                        Container(
                          padding: kPaddingX,
                          decoration: const BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: kRoundedBorder,
                          ),
                          child: DefaultTextStyle(
                            style: Get.textTheme.semibold.copyWith(color: Colors.white),
                            child: Row(children: [
                              const FaIcon(FontAwesomeIcons.calendar, size: 20, color: kSurfaceColor).pr,
                              DirectSelectList<String>(
                                values: const [
                                  'Lunes - 29/11',
                                  'Martes - 30/11',
                                  'Miércoles - 01/12',
                                  'Jueves - 02/12',
                                  'Viernes - 03/12',
                                  'Sábado - 04/11',
                                  'Domingo - 05/11',
                                ],
                                defaultItemIndex: 2,
                                itemBuilder: (String value) => DirectSelectItem(
                                  value: value,
                                  itemBuilder: (context, value) => Text(value, style: Get.textTheme.sub1),
                                ),
                                focusedItemDecoration: const BoxDecoration(
                                  border: Border.symmetric(horizontal: BorderSide(width: 1, color: Colors.black12)),
                                ),
                                onItemSelectedListener: (item, index, context) {
                                  controller.selectedDay(item);
                                  //Scaffold.of(context).showSnackBar(SnackBar(content: Text(item)));
                                },
                              ).expanded(),
                              const FaIcon(FontAwesomeIcons.sort, size: 20, color: Colors.white),
                            ]),
                          ),
                        ).pr2.expanded(),
                        Obx(() => IconButton(
                              icon: Icon(FontAwesomeIcons.thLarge, color: controller.showCategories.value ? kPrimaryColor : kDarkColor),
                              onPressed: () => controller.showCategories.toggle(),
                            )),
                      ]),
                    ),
                    sliver: SliverPadding(
                      padding: kPadding,
                      sliver: Obx(
                        () => controller.showCategories.value
                            ? _categories()
                            : SliverStaggeredGrid.countBuilder(
                                crossAxisCount: 2,
                                staggeredTileBuilder: (index) => StaggeredTile.fit(index == 0 ? 2 : 1),
                                mainAxisSpacing: kSpacing,
                                crossAxisSpacing: kSpacing,
                                itemCount: 11,
                                itemBuilder: (context, index) {
                                  if (index == 0) {
                                    return Text(controller.currentCategory.name, style: Get.textTheme.title.copyWith(color: kSecondaryColor));
                                  }
                                  final food = Food.random();
                                  return FoodCard(food);
                                },
                              ),
                      ),
                    ),
                  ),
                ],
              );
            },
            onLoading: const CircularProgressIndicator().centered(),
            onError: (error) => Text(error.toString(), style: Get.textTheme.headline1?.copyWith(color: kErrorColor)).centered(),
          ),
        ),
      ),
    ).overlayStyle(navigationBar: kBackgroundColor);
  }
}

Widget _categories() {
  final controller = Get.find<RestaurantController>();
  return LiveSliverGrid(
    itemCount: controller.categories.length,
    controller: controller.scrollController,
    showItemDuration: 150.milliseconds,
    showItemInterval: 50.milliseconds,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: kSpacing,
      crossAxisSpacing: kSpacing,
    ),
    itemBuilder: (context, index, animation) {
      return FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(animation),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -0.1),
            end: Offset.zero,
          ).animate(animation),
          child: CategoryCard(controller.categories[index]).mouse(() {
            controller.selectedCategory(index);
            controller.showCategories(false);
          }),
        ),
      );
    },
  );
}
