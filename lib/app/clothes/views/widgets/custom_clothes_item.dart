import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchombe/app/clothes/controller/clothes_card_item_controller.dart';
import 'package:tchombe/app/clothes/models/clothes.dart';
import 'package:tchombe/app/clothes/views/detail_clothes_view.dart';
import 'package:tchombe/app/looks/models/look.dart';
import 'package:tchombe/core/widgets/card/image_container.dart';
import 'package:tchombe/themes/tchombe_colors.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class CustomTchombeCard extends StatelessWidget {
  CustomTchombeCard({
    required this.clothes,
    required this.onPressClothesItem,
  });

  final ClothesCardItemController _clothesCardItemController =
      Get.put(ClothesCardItemController());

  final ClothesSummary clothes;
  final Function() onPressClothesItem;

  @override
  Widget build(BuildContext context) {

    return Obx(() => Padding(
          padding: const EdgeInsets.all(padding5),
          child: GestureDetector(
            onLongPress: onPressClothesItem,
            onTap: () {
              if (Get.arguments==null && _clothesCardItemController.listOfSelectItem.isEmpty) {
                Get.toNamed(DetailClothesView.routeName, arguments: clothes);
              } else {
                onPressClothesItem();
              }
            },
            child:ImageContainer(
              imageUri: clothes.summary.value!.imageUri,
              checkedListIsNotEmpty: _clothesCardItemController.listOfSelectItem.isEmpty,
              text: clothes.summary.value!.brand,
              price: clothes.summary.value!.price!.roundToDouble(),
              listHasItem: _clothesCardItemController.listOfSelectItem.contains(clothes),
            ),
          ),
        ));
  }
}
