import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchombe/app/clothes/controller/clothes_card_item_controller.dart';
import 'package:tchombe/app/clothes/controller/fetch_display_delete_clothes_controller.dart';
import 'package:tchombe/app/clothes/controller/tab_bar_clothes_controller.dart';
import 'package:tchombe/app/clothes/views/clothing-creation-form.dart';
import 'package:tchombe/app/clothes/views/widgets/custom_all_type_clothes.dart';
import 'package:tchombe/app/home/views/widgets/drawer.dart';
import 'package:tchombe/app/looks/controller/look_form_controller.dart';
import 'package:tchombe/app/type_of_clothes/model/type-clothes.dart';
import 'package:tchombe/core/widgets/background/custom_background_image.dart';
import 'package:tchombe/core/widgets/floating_action_button/floating_button.dart';
import 'package:tchombe/themes/tchombe_colors.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class ClothesView extends StatelessWidget {
  final CustomTabBar _customTabBar = Get.put(CustomTabBar());

  final FetchDisplayAndDeleteClothesController
      _fetchDisplayAndDeleteClothesController =
      Get.find<FetchDisplayAndDeleteClothesController>();

  ClothesCardItemController get _clothesCardItemController =>
      Get.find<ClothesCardItemController>();

  LookFormController get _lookFormController => Get.put(LookFormController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TypeEnumClothesExtension.typeClothes.length,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: leadingWidth30,
          title: Obx(
            () => _clothesCardItemController.listOfSelectItem.isEmpty
                ? Row(
                    children: [
                      Text(
                        'K_CLOTHES'.tr,
                      ),
                      Expanded(child: Container()),
                      InkWell(
                        onTap: () => Get.defaultDialog(
                          contentPadding: EdgeInsets.all(padding10),
                          title: 'K_COST'.tr,
                          content: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text:
                                      'K_MESSAGE_DILOG_TOTAL_COST_CLOTHES'.tr +
                                          ' ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: fontSize20),
                                  children: [
                                    TextSpan(
                                        text:
                                            '${_fetchDisplayAndDeleteClothesController.totalCostOfClothes} ${'K_DEVICE'.tr}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: TchombeColor.primarySwatch))
                                  ])),
                          textConfirm: 'K_Ok'.tr,
                          onConfirm: () => Get.back(),
                        ),
                        child: Container(
                          child: Row(
                            children: [
                              Icon(Icons.monetization_on),
                              Obx(
                                () => Padding(
                                  padding:
                                      const EdgeInsets.only(left: padding5),
                                  child: Text(
                                    '${_fetchDisplayAndDeleteClothesController.totalCostOfClothes.value} ${'K_DEVICE'.tr}',
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : Row(
                    children: [
                      IconButton(
                        onPressed:
                            _clothesCardItemController.clearAllSelectItem,
                        icon: Icon(Icons.close, size: icon30),
                      ),
                      Obx(() => Text(
                          '${_clothesCardItemController.countItemSelected}')),
                      Expanded(child: Container()),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Get.arguments == null
                            ? IconButton(
                                icon: Icon(Icons.delete_forever, size: icon30),
                                onPressed:
                                    _clothesCardItemController.deleteClothes)
                            : IconButton(
                                icon: Icon(Icons.check, size: icon30),
                                onPressed: () {
                                  _lookFormController.getListClothesLook(
                                      _clothesCardItemController
                                          .listOfSelectItem);
                                  Get.back();
                                  _clothesCardItemController.listOfSelectItem
                                      .clear();
                                },
                              ),
                      ),
                    ],
                  ),
          ),
          bottom: TabBar(
            controller: _customTabBar.tabController,
            indicatorColor: Colors.white,
            isScrollable: true,
            // tabs : TypeEnumClothesExtension.listTypeClothes.map((e) => Tab(text: e.tr,)).toList()
            tabs: TypeEnumClothesExtension.typeClothes
                .map(
                  (typeClothes) => Tab(
                      text:
                          _customTabBar.getTabBarTypeClothesTitle(typeClothes)),
                )
                .toList(),
          ),
        ),
        drawer: Get.arguments != null ? null : MainDrawer(),
        body: GetBuilder<CustomTabBar>(
          initState: (_) {
            _customTabBar.getClothesByType();
          },
          builder: (listController) {
            return CustomBackgroundImage(
              child: TabBarView(
                  controller: listController.tabController,
                  children: List.generate(
                    TypeEnumClothesExtension.typeClothes.length,
                    (index) => CustomAllTypeOfClothes(
                      listController.filterListClothes ?? [],
                    ),
                  )),
            );
          },
        ),
        floatingActionButton: Get.arguments == null
            ? CustomFloatingActionButton(
                heroTag: 'clothes',
                onPressButton: _customTabBar.onPressNavToClothesFormPage)
            : null,
      ),
    );
  }
}
