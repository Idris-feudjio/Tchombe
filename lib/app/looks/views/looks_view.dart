import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchombe/app/home/views/widgets/drawer.dart';
import 'package:tchombe/app/look_categories/category.dart';
import 'package:tchombe/app/looks/controller/look_card_item_controller.dart';
import 'package:tchombe/app/looks/models/look.dart';
import 'package:tchombe/app/looks/views/look_form.dart';
import 'package:tchombe/app/looks/views/widgets/custom_look.dart';
import 'package:tchombe/app/planification/controller/planning_form_controller.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';
import '../controller/custom_look_tab_bar_controller.dart';
import 'package:tchombe/core/widgets/background/custom_background_image.dart';
import 'package:tchombe/core/widgets/floating_action_button/floating_button.dart';

class LooksView extends StatelessWidget {
  PlanningFormController get _planningFormController =>
      Get.find<PlanningFormController>();

  final CustomLookTabBar _customLookTabBar = Get.put(CustomLookTabBar());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: LookCategoryExtension.lookCategory.length,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: leadingWidth30,
          title: GetBuilder<LookCardItemController>(
              builder: (lookCardItemController) {
            return lookCardItemController.listOfSelectItem.isEmpty
                ? Row(
                    children: [
                      Text('K_GENERALLOOK'.tr,
                          style: TextStyle(fontSize: fontSize25)),
                      Expanded(child: Container()),
                    ],
                  )
                : Row(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed:
                                lookCardItemController.clearAllSelectItem,
                            icon: Icon(Icons.close, size: icon30),
                          ),
                          Obx(() => lookCardItemController
                                      .countItemSelected.value !=
                                  0
                              ? Text(
                                  '${lookCardItemController.countItemSelected}')
                              : Text(''))
                        ],
                      ),
                      Expanded(child: Container()),
                      Get.arguments == null &&
                              lookCardItemController.listOfSelectItem.isNotEmpty
                          ? IconButton(
                              onPressed: lookCardItemController.deleteLook,
                              icon: Icon(Icons.delete_forever, size: icon30),
                            )
                          : IconButton(
                              onPressed: () {
                                _planningFormController.selectLook(
                                    lookCardItemController.lookToPlan);
                                lookCardItemController.listOfSelectItem.clear();
                                Get.back();
                              },
                              icon: Icon(Icons.check, size: icon30),
                            )
                    ],
                  );
          }),
          bottom: TabBar(
            controller: _customLookTabBar.tabController,
            indicatorColor: Colors.white,
            isScrollable: true,
            tabs: LookCategoryExtension.lookCategory
                .map((category) =>
                    Tab(text: _customLookTabBar.getTabBarTypeClothes(category)))
                .toList(),
          ),
        ),
        drawer: Get.arguments != null ? null : MainDrawer(),
        body: GetBuilder<CustomLookTabBar>(
          initState: (_) {
            _customLookTabBar.getLookByType();
          },
          builder: (customLookTabBar) {
            return CustomBackgroundImage(
                child: TabBarView(
              controller: customLookTabBar.tabController,
              children: List.generate(
                LookCategoryExtension.lookCategory.length,
                (index) => CustomItemsLook(
                  customLookTabBar.filterListLook ?? [],
                ),
              ),
            ));
          },
        ),
        floatingActionButton: Get.arguments == null
            ? CustomFloatingActionButton(
                heroTag: 'look',
                onPressButton: () => Get.to(() => LookCreationForm()))
            : null,
      ),
    );
  }
}
