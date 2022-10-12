import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tchombe/app/clothes/models/custom_pop_up_model.dart';
import 'package:tchombe/app/planification/controller/planning_controller.dart';
import 'package:tchombe/app/planification/controller/planning_detail_controller.dart';
import 'package:tchombe/app/planification/models/planning.dart';
import 'package:tchombe/app/planification/views/planning_form.dart';
import 'package:tchombe/core/widgets/custom_poup_menu.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class PlanningDetail extends StatelessWidget {
  static final String routeName = '/PlanningDetail';
//  PlanningDetail({this.planningSummary});

 // final PlanningSummary planningSummary;
  final PlanningController _planningController = Get.find<PlanningController>();

  PlanningDetailController get _planningDetailController =>
      Get.put(PlanningDetailController(Get.arguments));

  @override
  Widget build(BuildContext context) {
    final List<CustomPopUpModel> _customPopUpModel = [
      CustomPopUpModel(iconData: Icons.edit, text: 'K_EDIT'.tr),
      CustomPopUpModel(iconData: Icons.delete, text: 'K_DELETE'.tr),
      CustomPopUpModel(iconData: Icons.share, text: 'K_SHARE'.tr)
    ];

    onSelected(value) {
      if (value == 'K_EDIT'.tr) {
        Get.to(PlanningForm(planningSummary: Get.arguments));
      } else if (value == 'K_DELETE'.tr) {
        Get.defaultDialog(
            title: 'K_CONFIRM'.tr,
            content: Text('K_DELETE_MESSAGE'.tr),
            textCancel: 'K_CANCEL'.tr,
            textConfirm: 'K_Ok'.tr,
            onConfirm:
                _planningController.deletePlanning(Get.arguments.summary.id!),
            onCancel: () {});
      } else {
        shareFile();
      }
    }

    return Scaffold(
        appBar: AppBar(
          leadingWidth: leadingWidth30,
          title: Text('${Get.arguments.summary.value!.date}'),
          actions: [
            CustomPopUpMenu(
                customPopUpItems: _customPopUpModel,
                onSelected: () => onSelected)
          ],
        ),
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Container(
                  height: MediaQuery.of(context).size.height/2,
                  color: Colors.grey,
                  child: Card(
                    child: Image.file(
                        File(_planningDetailController.currentImage.value),fit: BoxFit.cover,),
                  ),
                ),
              ),
              Container(
                 height: 100,
                child: ListView.builder(
                    itemCount: _planningDetailController.imageList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Padding(
                          padding: const EdgeInsets.all(padding5),
                          child: InkWell(
                            onTap: () {
                              _planningDetailController.getLookImage();
                              _planningDetailController.changeCurrentImage(
                                  _planningDetailController.imageList[index]);
                            },
                            child: Container(
                              child: Image.file(File(_planningDetailController
                                  .imageList[index])),
                            ),
                          ));
                    }),
              )
            ],
          ),
        ));
  }
}

void shareFile() => Share.shareFiles(
      [
        '${Get.arguments.summary.value.imageUri}',
      ],
      text: 'https//tchombe.com \n' +
          Get.arguments.summary.value.description +
          '\nFrom Tchombé'.toUpperCase(),
    );
