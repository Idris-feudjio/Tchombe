import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tchombe/app/clothes/controller/detail_clothes_controller.dart';
import 'package:tchombe/app/clothes/controller/fetch_display_delete_clothes_controller.dart';
import 'package:tchombe/app/clothes/models/custom_pop_up_model.dart';
import 'package:tchombe/core/widgets/background/custom_background_image.dart';
import 'package:tchombe/core/widgets/custom_poup_menu.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class DetailClothesView extends StatelessWidget {
  static final String routeName = '/detailClothesView';

  final _fetchDisplayAndDeleteClothesController =
      Get.find<FetchDisplayAndDeleteClothesController>();

  final DetailClothesController _detailClothesController =
      Get.put(DetailClothesController(clothesSummary: Get.arguments));

  final List<CustomPopUpModel> _customPopUpModel = [
    CustomPopUpModel(iconData: Icons.edit, text: 'K_EDIT'.tr),
    CustomPopUpModel(iconData: Icons.delete, text: 'K_DELETE'.tr),
    CustomPopUpModel(iconData: Icons.share, text: 'K_SHARE'.tr)
  ];

  Widget customListTile({String? key, Icon? icon, String? value}) {
    return ListTile(
      leading: icon,
      title: Text(
        key!,
      ),
      trailing: Text(
        value!,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget customPopItem({Icon? icon, String? text}) {
    return Row(
      children: [
        icon!,
        SizedBox(width: width10),
        Text(text!),
      ],
    );
  }

  onSelect(value) {
    if (value == 'K_EDIT'.tr) {
      _detailClothesController.getResponse();
    } else if (value == 'K_DELETE'.tr) {
      Get.defaultDialog(
          title: 'K_CONFIRM'.tr,
          content: Text('K_DELETE_MESSAGE'.tr),
          textCancel: 'K_CANCEL'.tr,
          textConfirm: 'K_Ok'.tr,
          onConfirm: _fetchDisplayAndDeleteClothesController
              .deleteClothes(_detailClothesController.clothes.summary.id.toString()),
          onCancel: () {});
    } else {
      shareFile();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<DetailClothesController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            leadingWidth: leadingWidth30,
            title: Text(
              controller.clothes.summary.value!.brand,
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            actions: [
              CustomPopUpMenu(
                  customPopUpItems: _customPopUpModel,
                  onSelected: () => onSelect)
            ],
          ),
          body: CustomBackgroundImage(
            child: Container(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/singleImagePage', arguments: Get.arguments);
                    },
                    child: Container(
                      height: size.height * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(borderRadius20),
                              bottomRight: Radius.circular(borderRadius20)),
                          image: DecorationImage(
                              image: FileImage(
                                File(
                                    controller.clothes.summary.value!.imageUri),
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          customListTile(
                              key: 'K_CLOTHES_NAME'.tr,
                              icon: Icon(Icons.star,
                                  color: Theme.of(context).iconTheme.color),
                              value: controller
                                      .clothes.summary.value!.clothesName ??
                                  ''),
                          Divider(height: height0),
                          customListTile(
                              key: 'K_TYPE'.tr,
                              icon: Icon(Icons.star,
                                  color: Theme.of(context).iconTheme.color),
                              value: controller
                                      .clothes.summary.value!.clothesType ??
                                  ''),
                          Divider(height: height0),
                          customListTile(
                              key: 'K_BRAND'.tr,
                              icon: Icon(Icons.branding_watermark,
                                  color: Theme.of(context).iconTheme.color),
                              value: controller.clothes.summary.value!.brand),
                          Divider(height: height0),
                          customListTile(
                              key: 'K_COLOR'.tr,
                              icon: Icon(Icons.color_lens,
                                  color: Theme.of(context).iconTheme.color),
                              value: controller.clothes.summary.value!.color ??
                                  ''),
                          Divider(height: height0),
                          customListTile(
                              key: 'K_PRICE'.tr,
                              icon: Icon(Icons.attach_money,
                                  color: Theme.of(context).iconTheme.color),
                              value: controller.clothes.summary.value!.price
                                  .toString()),
                          Divider(height: height0),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  leading: Icon(Icons.text_fields,
                                      color: Theme.of(context).iconTheme.color),
                                  title: Text(
                                    'K_DESCRIPTION'.tr,
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                      "${controller.clothes.summary.value!.clothesDescription ?? ''}",
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.visible,
                                      softWrap: true,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));
    });
  }

  void shareFile() => Share.shareFiles(
        [
          '${_detailClothesController.clothes.summary.value!.imageUri}',
        ],
        text:
            '${_detailClothesController.clothes.summary.value!.clothesName} \n' +
                _detailClothesController.clothes.summary.value!.clothesName!,
        subject:
            '${_detailClothesController.clothes.summary.value!.clothesName}',
      );
}
