import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchombe/app/looks/controller/look_card_item_controller.dart';
import 'package:tchombe/app/looks/models/look.dart';
import 'package:tchombe/app/looks/views/detail_look_view.dart';
import 'package:tchombe/core/widgets/card/image_container.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class CustomLookCard extends StatelessWidget {
  CustomLookCard({required this.look, required this.onLongPress});

  final LookSummary look;
  final Function() onLongPress;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LookCardItemController>(
      builder: (lookCardItemController) {
        return Padding(
          padding: const EdgeInsets.all(padding5),
          child: InkWell(
            onLongPress: onLongPress,
            onTap: () {
              if (Get.arguments == null &&
                  lookCardItemController.listOfSelectItem.isEmpty) {
                Get.toNamed(DetailLookView.routeName, arguments: look);
              } else {
                onLongPress();
              }
            },
            child: ImageContainer(
              imageUri: look.summary.value!.imageUri,
              checkedListIsNotEmpty: lookCardItemController.listOfSelectItem.isEmpty,
              text: look.summary.value!.description!,
              price: look.summary.value!.costOfALook!.roundToDouble(),
              listHasItem: lookCardItemController.listOfSelectItem.contains(look),
            ),
          ),
        );
      },
    );
  }
}
