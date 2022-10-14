import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchombe/app/looks/models/look.dart';
import 'package:tchombe/app/planification/controller/planning_controller.dart';
import 'package:tchombe/app/planification/models/planning.dart';
import 'package:tchombe/core/model/abstract_summary_dto.dart';

class PlanningCardItemController extends GetxController {
  RxList<PlanningSummary> listOfPlanning = RxList<PlanningSummary>();
  PlanningController _planningController = Get.find<PlanningController>();
  RxInt countSelectedPlanning = 0.obs;

  LookSummary getLookSummary(Look look, String id) {
    AbstractSummaryDto<Look> abstractDto = AbstractSummaryDto(look, id);
    LookSummary lookSummary = LookSummary(abstractDto);
    return lookSummary;
  }

  deletePlanning() async {
    var result = await Get.defaultDialog(
        title: 'K_CONFIRM'.tr,
        content: Text('K_DELETE_MESSAGE'.tr),
        radius: 5,
        onCancel: () => Get.back(),
        onConfirm: () {
          listOfPlanning.forEach((PlanningSummary planningSummary) {
            _planningController.deletePlanning(planningSummary.summary.id!.toString());
          });
        });
    if (result == true) {
      _planningController.listOfPlanningFetchInDb.value =
          await _planningController.fetchPlanning();
      listOfPlanning.clear();
      countSelectedPlanning.value = 0;
    }
  }

  getListOfLook(PlanningSummary planning) {
    if (listOfPlanning.contains(planning)) {
      listOfPlanning.remove(planning);
      countSelectedPlanning--;
    } else {
      listOfPlanning.add(planning);
      countSelectedPlanning++;
    }
  }

  clearSelectedItems() {
    listOfPlanning.clear();
    countSelectedPlanning.value = 0;
  }

  @override
  void onClose() {
    listOfPlanning.clear();
    countSelectedPlanning.value = 0;
    super.onClose();
  }

  @override
  void dispose() {
    listOfPlanning.close();
    countSelectedPlanning.value = 0;
    super.dispose();
  }
}
