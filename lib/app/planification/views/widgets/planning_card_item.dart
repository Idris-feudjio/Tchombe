import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchombe/app/looks/views/detail_look_view.dart';
import 'package:tchombe/app/planification/controller/planning_card_controller.dart';
import 'package:tchombe/app/planification/models/planning.dart';
import 'package:tchombe/core/widgets/card/image_container.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class PlanningCardItem extends StatelessWidget {
  PlanningCardItem({required this.onLongPress, required this.planningSummary});

  final PlanningCardItemController _planningCardItemController =
      Get.put(PlanningCardItemController());

  final Function() onLongPress;
  final PlanningSummary planningSummary;

  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
          onLongPress: onLongPress,
          onTap: () {
            if (_planningCardItemController.listOfPlanning.isEmpty) {
              Get.toNamed(DetailLookView.routeName,
                  arguments: _planningCardItemController.getLookSummary(
                      planningSummary.summary.value!.lookAssociated,
                      planningSummary.summary.id!),
                  parameters: {'date': planningSummary.summary.value!.date});
            } else {
              onLongPress();
            }
          },
          child: ImageContainer(
            containerWith: width150,
            imageUri: planningSummary.summary.value!.lookAssociated.imageUri,
            checkedListIsNotEmpty:
                _planningCardItemController.listOfPlanning.isEmpty,
            listHasItem: _planningCardItemController.listOfPlanning
                .contains(planningSummary),
          ),
        ));
  }
}
