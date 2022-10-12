import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchombe/app/looks/views/looks_view.dart';
import 'package:tchombe/app/planification/controller/planning_form_controller.dart';
import 'package:tchombe/app/planification/models/planning.dart';
import 'package:tchombe/core/widgets/background/custom_background_image.dart';
import 'package:tchombe/core/widgets/button/custom_button.dart';
import 'package:tchombe/themes/tchombe_colors.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class PlanningForm extends StatelessWidget {
  PlanningForm({this.planningSummary});

  final PlanningSummary? planningSummary;

  PlanningFormController get _planningFormController =>
      Get.put(PlanningFormController(planningSummary: planningSummary));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: leadingWidth30,
        title: Text('K_PLAN_LOOK'.tr),
      ),
      body: CustomBackgroundImage(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(padding8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .45,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'K_CHOOSE_DATE'.tr,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: CalendarDatePicker(
                            firstDate: DateTime.now(),
                            onDateChanged:
                                _planningFormController.onDateChanged,
                            initialDate: _planningFormController.date,
                            lastDate: DateTime(2030),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(padding3),
                        child: Row(
                          children: [
                            Expanded(child: Container()),
                            Obx(() => dateFormatOf(_planningFormController
                                .currentStringDayOfWeek.value)),
                            SizedBox(width: width2),
                            Obx(() => dateFormatOf(_planningFormController
                                .currentIntegerDay.value)),
                            SizedBox(width: width2),
                            Obx(() => dateFormatOf(_planningFormController
                                .currentStringMonthAndYear.value))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Obx(
                  () => _planningFormController.listOfImage.isNotEmpty
                      ? Column(
                          children: [
                            Text(
                              'K_LOOK_OF_THE_DAY'.tr,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Divider(endIndent: 30, indent: 30,thickness: 2,),
                            Container(
                              height: height100,
                              child: Obx(() => ListView.builder(
                                  itemCount: _planningFormController
                                      .listOfImage.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: padding3),
                                      child: Container(
                                        width: width100,
                                        height: height100,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2, color: Colors.white),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: FileImage(File(
                                                    _planningFormController
                                                        .listOfImage[index])))),
                                      ),
                                    );
                                  })),
                            ),
                          ],
                        )
                      : Padding(
                          padding: const EdgeInsets.all(padding8),
                          child: Container(
                            child: Text(
                              'K_NOT_LOOK_OF_THE_DAY'.tr,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                ),

                Obx(() => _planningFormController.lookImage.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(endIndent: 30, indent: 30,thickness: 2),
                          Container(
                            height: height100,
                            width: height100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: FileImage(File(
                                        '${_planningFormController.lookImage}')),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      )
                    : Container()),
                Padding(
                  padding: const EdgeInsets.all(padding3),
                  child: InkWell(
                    onTap: () => Get.to(() => LooksView(),
                        arguments:
                            _planningFormController.currentIntegerDay.value,
                        transition: Transition.leftToRight),
                    child: Obx(() =>
                        _planningFormController.lookImage.isNotEmpty
                            ? buildCustomButton(context, 'K_CHANGE'.tr)
                            : buildCustomButton(context, 'K_CHOOSE_LOOK'.tr)),
                  ),
                ),
                Obx(
                  () => _planningFormController.lookImage.isNotEmpty
                      ? CustomButton(
                          buttonColor: Theme.of(context).buttonColor,
                          child: Text(
                           'K_PLAN'.tr,
                            style: TextStyle(
                                color: TchombeColor.kGwhite,
                                fontSize: fontSize25,
                                fontWeight: FontWeight.bold),
                          ),
                          buttonFunction: _planningFormController.savePlanning)
                      : Container(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  CustomButton buildCustomButton(BuildContext context, String text) {
    return CustomButton(
      buttonColor: Theme.of(context).buttonColor,
      child: Text(
        text,
        style: TextStyle(
            color: TchombeColor.kGwhite,
            fontSize: fontSize25,
            fontWeight: FontWeight.bold),
      ),
      buttonFunction: () => Get.to(() => LooksView(),
          arguments: _planningFormController.currentIntegerDay.value,
          transition: Transition.leftToRight),
    );
  }

  Widget dateFormatOf(String date) {
    return Text(date,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize18,
        ));
  }
}
