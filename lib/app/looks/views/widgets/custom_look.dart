import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchombe/app/looks/controller/custom_look_tab_bar_controller.dart';
import 'package:tchombe/app/looks/controller/look_card_item_controller.dart';
import 'package:tchombe/app/looks/models/look.dart';
import 'package:tchombe/app/looks/views/widgets/card_of_look.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';
import 'package:tchombe/utils/tchombe_asset.dart';

class CustomItemsLook extends StatelessWidget {
  CustomItemsLook(this.listOfLook);

  final lookCardItemController = Get.put(LookCardItemController());
  final CustomLookTabBar _customLookTabBar = Get.find<CustomLookTabBar>();

  final List<LookSummary> listOfLook;

  @override
  Widget build(BuildContext context) {
    return listOfLook.isEmpty
        ? Padding(
            padding: EdgeInsets.all(padding10),
            child: Center(
              child: Image.asset(
                TchombeAsset.IMG_EMPTY_LIST,
                height: height150,
                width: double.infinity,
              ),
            ))
        : Obx(() => RefreshIndicator(
            onRefresh:()=> _customLookTabBar.onRefresh(),
            child: Padding(
              padding: const EdgeInsets.all(padding3),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: .7,
                    crossAxisSpacing: 3 / 2,
                  ),
                  itemCount: listOfLook.length,
                  itemBuilder: (context, index) {
                    return CustomLookCard(
                        look: listOfLook[index],
                        onLongPress: () {
                          lookCardItemController
                              .getSelectItem(listOfLook[index]);
                        });
                  }),
            )));
  }
}
