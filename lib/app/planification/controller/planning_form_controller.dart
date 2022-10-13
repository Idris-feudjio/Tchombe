import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tchombe/app/looks/models/look.dart';
import 'package:tchombe/app/planification/controller/planning_controller.dart';
import 'package:tchombe/app/planification/models/planning.dart';
import 'package:tchombe/app/planification/services/planning_repository.dart';
import 'package:tchombe/core/functions/open_snackbar.dart';
import 'package:tchombe/core/model/abstract_summary_dto.dart';

class PlanningFormController extends GetxController {
  PlanningFormController({this.planningSummary});

  final PlanningSummary? planningSummary;

  PlanningRepository _planningRepository = PlanningRepository();

  TextEditingController txtEvent = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();

  late Look _look;

  RxString currentStringDayOfWeek = ''.obs;
  RxString currentIntegerDay = ''.obs;
  RxString currentStringMonthAndYear = ''.obs;
  RxString dateOfDay = ''.obs;
  RxString lookImage = ''.obs;
  RxBool cardHasNoImage = false.obs;
  RxString initialDate = ''.obs;
  DateTime date = DateTime.now();

  PlanningController _planningController = Get.put(PlanningController());

  RxList<String> listOfImage = <String>[].obs;

  @override
  void onInit() {
    if (isUpdate) editPlanning();
    onDateChanged(DateTime.now());
    super.onInit();
  }

  bool get isUpdate => planningSummary != null;

  onDateChanged(DateTime dateTime) {
    currentStringDayOfWeek.value = DateFormat('EEEEE').format(dateTime);
    currentIntegerDay.value = DateFormat('d').format(dateTime);
    currentStringMonthAndYear.value = DateFormat('MMM, yyyy').format(dateTime);
    dateOfDay.value = DateFormat('d/MM/yyyy').format(dateTime);
    listOfImage.value = _planningController.getImageByDate(dateOfDay.value);
  }

  selectLook(LookSummary look) {
    lookImage.value = look.summary.value!.imageUri;
    _look = look.summary.value!;
  }

  resetPlanning() {
    txtEvent.clear();
    lookImage.value = '';
  }

  editPlanning() {
    lookImage.value = planningSummary!.summary.value!.lookAssociated.imageUri;
    dateOfDay.value = planningSummary!.summary.value!.date;
    _look = planningSummary!.summary.value!.lookAssociated;
    txtEvent.text = planningSummary!.summary.value!.event;
    date = DateFormat('d/MM/yyyy').parse(dateOfDay.value);
  }

  savePlanning() async {
    if (lookImage.value != '') {
      var item = Planning((p) => p
        ..date = dateOfDay.value
        ..lookAssociated = _look.toBuilder()
        ..event = txtEvent.text);
      if (isUpdate) {
        _planningRepository.update(item, planningSummary!.summary.id!.toString());
        CoreFunction.openSnackBar('K_SUCCES'.tr, 'K_EDIT_SUCCEFULL'.tr);
      } else {
        _planningRepository.insert(item);
        _planningController.listOfPlanningFetchInDb.value =
            await _planningController.fetchPlanning();
        Get.back(result: true);
        CoreFunction.openSnackBar('K_SUCCES'.tr, 'K_CREATE_SUCCEFULL'.tr);
      }
      resetPlanning();
    } else {
      cardHasNoImage.value = true;
    }
  }
}
