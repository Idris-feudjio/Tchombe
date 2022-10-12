import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tchombe/app/clothes/models/custom_pop_up_model.dart';
import 'package:tchombe/app/looks/controller/look_crud.dart';
import 'package:tchombe/app/looks/controller/look_detail_controller.dart';
import 'package:tchombe/app/looks/views/look_form.dart';
import 'package:tchombe/app/looks/views/single_look_image.dart';
import 'package:tchombe/core/widgets/background/custom_background_image.dart';
import 'package:tchombe/core/widgets/custom_poup_menu.dart';
import 'package:tchombe/themes/tchombe_colors.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class DetailLookView extends StatelessWidget {
  DetailLookView({Key? key}) : super(key: key);
  static final String routeName = '/detailLookView';

  final FetchDisplayAndDeleteLookController
      _fetchDisplayAndDeleteLookController =
      Get.find<FetchDisplayAndDeleteLookController>();
  final LookDetailController _lookDetailController =
      Get.put(LookDetailController(lookSummary: Get.arguments));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

    final List<CustomPopUpModel> _customPopUpModel = [
      CustomPopUpModel(iconData: Icons.edit, text: 'K_EDIT'.tr),
      CustomPopUpModel(iconData: Icons.delete, text: 'K_DELETE'.tr),
      CustomPopUpModel(iconData: Icons.share, text: 'K_SHARE'.tr)
    ];

    onSelected(value) {
      if (value == 'K_EDIT'.tr) {
        _lookDetailController.getResponseAfterLookEdit();
      } else if (value == 'K_DELETE'.tr) {
        Get.defaultDialog(
            title: 'K_CONFIRM'.tr,
            content: Text('K_DELETE_MESSAGE'.tr),
            textCancel: 'K_CANCEL'.tr,
            textConfirm: 'K_Ok'.tr,
            onConfirm: _fetchDisplayAndDeleteLookController
                .deleteLook(_lookDetailController.look.summary.id!),
            onCancel: () {});
      } else {
        shareFile();
      }
    }

    return Scaffold(
      appBar: AppBar(
        leadingWidth: leadingWidth30,
        title: Get.parameters.isEmpty //false when we use planning
            ? Text('K_LOOK_DETAIL'.tr)
            : Text('K_LOOK_OF_THE_DAY'.tr + ' ${Get.parameters['date']}'),
        actions: [
          Get.parameters.isEmpty //false when we use planning
              ? CustomPopUpMenu(
                  customPopUpItems: _customPopUpModel,
                  onSelected: () => onSelected)
              : Container()
        ],
      ),
      body: CustomBackgroundImage(
        child:
            GetBuilder<LookDetailController>(builder: (lookDetailController) {
          return SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                    onTap: () {
                      lookDetailController.getImageList();
                      Get.to(SingleLookImage(lookDetailController.imageList));
                    },
                    child: Obx(() => Container(
                          height: size.height * .4,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(File(
                                  lookDetailController.currentImage.value)),
                            ),
                          ),
                        ))),
                Container(
                  height: orientation == Orientation.portrait
                      ? size.height * .2
                      : size.height * .4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadius5)),
                  width: double.infinity,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => lookDetailController.changeCurrentImage(
                            lookDetailController.imageList[0]),
                        child: Container(
                          width: size.width * 0.35,
                          decoration: BoxDecoration(
                           // color: Colors.pink,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(
                                  File(lookDetailController.imageList[0])),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount:
                                lookDetailController.listOkClothesLook.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              var clothes =
                                  lookDetailController.listOkClothesLook[index];
                              return Padding(
                                padding: const EdgeInsets.all(padding3),
                                child: InkWell(
                                  onTap: () => lookDetailController
                                      .changeCurrentImage(clothes.imageUri),
                                  child: Container(
                                      width: size.width * 0.35,
                                      decoration: BoxDecoration(
                                        color: Colors.pink,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              FileImage(File(clothes.imageUri)),
                                        ),
                                      ),
                                      child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                              width: double.infinity,
                                              color: TchombeColor.K_button[500],
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                child: Text(
                                                  '${clothes.brand}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              )))),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height5),
                Padding(
                  padding: const EdgeInsets.all(padding5),
                  child: Container(
                      // decoration:  BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Padding(
                    padding:
                        const EdgeInsets.only(left: padding5, right: padding3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Row(
                          children: [
                            Text(
                              'K_COST'.tr,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Expanded(child: Container()),
                            Chip(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(borderRadius10)),
                                backgroundColor: Colors.green,
                                label: Text(
                                    '${lookDetailController.look.summary.value!.costOfALook!.roundToDouble()} ${'K_DEVICE'.tr}',
                                    style: TextStyle(
                                        fontSize: fontSize20,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color,
                                        fontWeight: FontWeight.bold)))
                          ],
                        )),
                        Column(
                          children: [
                            buildRow('K_SELECT_CATEGORIES'.tr),
                            Container(
                              height: orientation == Orientation.portrait
                                  ? size.height * .07
                                  : size.height * .14,
                              child: ListView.builder(
                                  itemCount: lookDetailController.look.summary
                                      .value!.listOfCategory.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(padding5),
                                      child: Chip(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: padding10),
                                          backgroundColor: Theme.of(context)
                                              .appBarTheme
                                              .color,
                                          labelStyle: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                          label: Text(
                                            lookDetailController.look.summary
                                                .value!.listOfCategory[index],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                    );
                                  }),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            buildRow('K_DESCRIPTION'.tr),
                            Padding(
                              padding: const EdgeInsets.all(padding10),
                              child: Text(
                                lookDetailController
                                    .look.summary.value!.description!,
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: fontSize18),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  Row buildRow(String text) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: width5,
        ),
        Expanded(
            child: Divider(
          thickness: 2,
        ))
      ],
    );
  }

  void shareFile() => Share.shareFiles(
        [
          '${_lookDetailController.look.summary.value!.imageUri}',
        ],
        text: 'https//tchombe.com \n' +
            _lookDetailController.look.summary.value!.description! +
            '\nFrom Tchombé'.toUpperCase(),
      );
}
