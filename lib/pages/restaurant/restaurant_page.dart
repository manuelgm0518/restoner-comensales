import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:restoner_comensales/components/food_card.dart';
import 'package:restoner_comensales/config/app_themes.dart';
import 'package:restoner_comensales/models/food.dart';
import 'package:restoner_comensales/utils/ui_utils.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';
import 'restaurant_controller.dart';
export 'restaurant_controller.dart';

const _kExpandedHeaderHeight = 180.0;
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
                                  image: AssetImage('assets/pictures/restaurant.jpg'),
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
                          ).aligned(Alignment.bottomRight),
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
                        FlexibleTextItem(
                          text: state.name,
                          collapsedStyle: Get.textTheme.sub2.copyWith(color: kSecondaryColor),
                          expandedStyle: Get.textTheme.title.copyWith(color: kSurfaceColor),
                          expandedAlignment: Alignment.bottomLeft,
                          collapsedAlignment: Alignment.center,
                          expandedPadding: kPadding,
                          overflow: TextOverflow.ellipsis,
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
                    header: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                      Container(
                        //height: 45,
                        margin: kPadding,
                        padding: kPaddingX,
                        //padding: kPadding2,
                        // margin: const EdgeInsets.symmetric(horizontal: kSpacing, vertical: kSpacing2),
                        decoration: const BoxDecoration(
                          color: kLightColor,
                          borderRadius: kRoundedBorder,
                        ),
                        child: Row(children: [
                          FaIcon(FontAwesomeIcons.calendar, size: 20).pr,
                          DirectSelectList<String>(
                            values: const [
                              'Lunes - 29/11',
                              'Martes - 30/11',
                              'Miércoles - 1/12',
                              'Jueves - 2/12',
                              'Viernes - 3/12',
                              'Sábado - 27/11',
                              'Domingo - 28/11',
                            ],
                            defaultItemIndex: 5,
                            itemBuilder: (String value) => DirectSelectItem(
                              value: value,
                              itemBuilder: (context, value) => Text(value, style: Get.textTheme.sub1),
                            ),
                            //focusedItemDecoration: _getDslDecoration(),
                            onItemSelectedListener: (item, index, context) {
                              controller.selectedDay(item);
                              //Scaffold.of(context).showSnackBar(SnackBar(content: Text(item)));
                            },
                          ).expanded(),
                          FaIcon(FontAwesomeIcons.sort, size: 20),
                        ]),
                        // child: Row(children: [
                        //   for (int i = 0; i < 7; i++)
                        //     Text(
                        //       _kWeekdays[i],
                        //       textAlign: TextAlign.center,
                        //       style: Get.textTheme.buttons.copyWith(color: kSurfaceColor),
                        //     ).bottom([
                        //       Text(
                        //         (i + 10).toString(),
                        //         textAlign: TextAlign.center,
                        //         style: Get.textTheme.info.copyWith(color: kSurfaceColor),
                        //       ),
                        //     ], crossAxisAlignment: CrossAxisAlignment.center).expanded(),
                        // ]),
                      ),
                      Container(
                        decoration: const BoxDecoration(color: kSurfaceColor, border: Border.symmetric(horizontal: BorderSide(color: kLightColor, width: 1))),
                        child: Row(children: [
                          for (int i = 0; i < 5; i++)
                            Obx(() {
                              final selected = controller.selectedCategory.value == i;
                              return Text(
                                'Desayuno #$i',
                                style: Get.textTheme.sub2.copyWith(
                                  color: selected ? kPrimaryColor : kDarkColor,
                                  //fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                                ),
                              );
                            }).mouse(() => controller.selectedCategory(i)).px,
                        ]).scrollable(direction: Axis.horizontal, padding: kPadding),
                      ),
                    ]).backgroundColor(kSurfaceColor),
                    sliver: SliverPadding(
                      padding: kPadding,
                      sliver: SliverStaggeredGrid.countBuilder(
                        crossAxisCount: 2,
                        staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                        mainAxisSpacing: kSpacing,
                        crossAxisSpacing: kSpacing,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          final food = Food.random();
                          return FoodCard(food);
                        },
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
