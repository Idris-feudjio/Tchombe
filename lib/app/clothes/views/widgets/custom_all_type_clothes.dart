import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchombe/app/clothes/controller/clothes_card_item_controller.dart';
import 'package:tchombe/app/clothes/controller/fetch_display_delete_clothes_controller.dart';
import 'package:tchombe/app/clothes/controller/tab_bar_clothes_controller.dart';
import 'package:tchombe/app/clothes/models/clothes.dart';
import 'package:tchombe/app/clothes/views/widgets/custom_clothes_item.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';
import 'package:tchombe/utils/tchombe_asset.dart';

class CustomAllTypeOfClothes extends StatelessWidget {
  CustomAllTypeOfClothes(this.listOfClothes);

  final ClothesCardItemController clothesCardItemController =
      Get.put(ClothesCardItemController());
  final CustomTabBar _customTabBar = Get.find<CustomTabBar>();


  final List<ClothesSummary> listOfClothes;

  @override
  Widget build(BuildContext context) {
    return listOfClothes.isEmpty
        ? Padding(
            padding: EdgeInsets.all(padding20),
            child: Center(
              child: Container(
                child: Image.asset(
                  TchombeAsset.IMG_EMPTY_LIST,
                  height: height150,
                  width: double.infinity,
                ),
              ),
            ))
        : Obx(() => RefreshIndicator(
              onRefresh: () =>  _customTabBar.onRefresh(),
              child: Padding(
                padding: const EdgeInsets.all(padding3),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      childAspectRatio: .7,
                      crossAxisSpacing: 3 / 2,
                    ),
                    itemCount: listOfClothes.length,
                    itemBuilder: (context, index) {
                      return CustomTchombeCard(
                        clothes: listOfClothes[index],
                        onPressClothesItem: () {
                          clothesCardItemController
                              .selectItem(listOfClothes[index]);
                        },
                      );
                    }),
              ),
            ));
  }
}
