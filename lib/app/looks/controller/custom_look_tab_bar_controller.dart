import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchombe/app/look_categories/category.dart';
import 'package:tchombe/app/looks/controller/look_crud.dart';
import 'package:tchombe/app/looks/models/look.dart';

class CustomLookTabBar extends GetxController
    with SingleGetTickerProviderMixin {
  FetchDisplayAndDeleteLookController _fetchDisplayAndDeleteLookController =
      Get.put(FetchDisplayAndDeleteLookController());
  RxList<LookSummary>? listLook;
  RxList<LookSummary>? filterListLook;
  TabController? tabController;

  @override
  Future<void> onInit() async {
    listLook = await _fetchDisplayAndDeleteLookController.fetchData();
    filterListLook = listLook;
    tabController = TabController(length: 9, vsync: this);
    getLookByType();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getTabBarTypeClothes(LookCategory lookCategory) {
    return lookCategory.name;
  }

  getTabBarFilter(int index) {
    return categoryIsInListOfLook(
        getTabBarTypeClothes(LookCategoryExtension.getLookByCategory(index)));
  }

  getLookByType() {
    tabController!.addListener(() async {
      int index = tabController!.index;
      filterListLook!.value = await getTabBarFilter(index);
      update();
    });
  }
  onRefresh() async {
    int index = tabController?.index ?? 0;
    filterListLook!.value = await getTabBarFilter(index);
    update();
    return filterListLook;

  }

  Future<List<LookSummary>> categoryIsInListOfLook(category) async {
    List<LookSummary> listOfLook =
        await _fetchDisplayAndDeleteLookController.fetchData();
    List<LookSummary> filterLook = [];
    if (category == getTabBarTypeClothes(LookCategory.ALL)) {
      filterLook = listOfLook;
    } else {
      listOfLook.forEach(
        (LookSummary look) {
          if (look.summary.value!.listOfCategory.contains(category)) {
            filterLook.add(look);
          }
        },
      );
    }
    update();
    return filterLook;
  }
}
