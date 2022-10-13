import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchombe/app/clothes/controller/fetch_display_delete_clothes_controller.dart';
import 'package:tchombe/app/clothes/models/clothes.dart';

class ClothesCardItemController extends GetxController {
  FetchDisplayAndDeleteClothesController
      _fetchDisplayAndDeleteClothesController =
      Get.find<FetchDisplayAndDeleteClothesController>();

  RxList<ClothesSummary> listOfSelectItem = RxList<ClothesSummary>();
  RxInt countItemSelected = 0.obs;

  ///IMPLEMENT MULTI SELECT
  selectItem(ClothesSummary clothes) {
    if (listOfSelectItem.contains(clothes)) {
      listOfSelectItem.remove(clothes);
      countItemSelected -= 1;
    } else {
      listOfSelectItem.add(clothes);
      countItemSelected += 1;
    }
    update();
  }

  /// CLEAR ALL SELECTED ITEMS
  clearAllSelectItem() {
    listOfSelectItem.clear();
    countItemSelected = 0.obs;
  }

  deleteClothes() async {
    var result = await Get.defaultDialog(
      title: 'K_CONFIRM'.tr,
      content: Text('K_DELETE_MESSAGE'.tr),
      textCancel: 'K_CANCEL'.tr,
      onCancel: () {},
      onConfirm: () => listOfSelectItem.forEach((ClothesSummary id) =>
          _fetchDisplayAndDeleteClothesController.deleteClothes(id.summary.id.toString())),
    );
    if (result == true) {
      _fetchDisplayAndDeleteClothesController.fetchListClotheInData =
          await _fetchDisplayAndDeleteClothesController.fetchData();
      clearAllSelectItem();
    }
  }
}
