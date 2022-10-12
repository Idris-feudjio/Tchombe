import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchombe/app/clothes/controller/fetch_display_delete_clothes_controller.dart';
import 'package:tchombe/app/clothes/models/clothes.dart';
import 'package:tchombe/app/clothes/views/clothing-creation-form.dart';
import 'package:tchombe/app/type_of_clothes/model/type-clothes.dart';

class CustomTabBar extends GetxController with SingleGetTickerProviderMixin {
  RxList<ClothesSummary>? listClothes;
  RxList<ClothesSummary>? filterListClothes;
  TabController? tabController;
  FetchDisplayAndDeleteClothesController
      _fetchDisplayAndDeleteClothesController =
      Get.find<FetchDisplayAndDeleteClothesController>();

  @override
  Future<void> onInit() async {
    filterListClothes =
        await _fetchDisplayAndDeleteClothesController.fetchData();
    tabController = TabController(
         length: TypeEnumClothesExtension.typeClothes.length, vsync: this
    );
    getClothesByType();
    super.onInit();
  }

  getTabBarTypeClothesTitle(TypeEnumClothes typClothes) {
    return typClothes.getClothesTitle;
  }

  Future<List<ClothesSummary>> getTabBarFilter(int index) {
    return filterClothesByType(getTabBarTypeClothesTitle(
        TypeEnumClothesExtension.getTabBarTypeClothes(index)));
  }

  getClothesByType() {
    tabController?.addListener(() async {
      int index = tabController?.index ?? 0;
      filterListClothes!.value = await getTabBarFilter(index);
    });
  }

  onRefresh() async {
    int indexTab = tabController?.index ?? 0;
    filterListClothes!.value = await getTabBarFilter(indexTab);
    return filterListClothes;
  }

  onPressNavToClothesFormPage() async {
    var result = await Get.to(() => ClothingCreationForm());
    if (result == true) {
      _fetchDisplayAndDeleteClothesController.fetchListClotheInData =
          await _fetchDisplayAndDeleteClothesController.fetchData();
      tabController?.index = 0;
    }
  }

  Future<List<ClothesSummary>> filterClothesByType(typeClothes) async {
    List<ClothesSummary> type =
        await _fetchDisplayAndDeleteClothesController.fetchData();
    List<ClothesSummary> filterClothes = [];
    if (typeClothes == getTabBarTypeClothesTitle(TypeEnumClothes.ALL)) {
      filterClothes = type;
    } else {
      type.forEach((ClothesSummary clothes) {
        if (clothes.summary.value?.clothesType == typeClothes) {
          filterClothes.add(clothes);
        }
      });
    }
    update();
    return filterClothes;
  }
}
