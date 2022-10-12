import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tchombe/app/clothes/views/clothes_view.dart';
import 'package:tchombe/app/looks/controller/look_form_controller.dart';
import 'package:tchombe/core/widgets/background/custom_background_image.dart';
import 'package:tchombe/core/widgets/button/custom_button.dart';
import 'package:tchombe/core/widgets/card/card_pick_image.dart';
import 'package:tchombe/core/widgets/textfield/textfield.dart';
import 'package:tchombe/themes/tchombe_colors.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class LookCreationForm extends StatelessWidget {
  LookFormController get _lookFormController =>
      Get.put(LookFormController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: leadingWidth30,
        title: Text(titleAppBar),
      ),
      body: CustomBackgroundImage(
          child: Padding(
        padding: const EdgeInsets.all(padding8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                              splashColor: Colors.grey,
                              onTap: () {
                                Get.defaultDialog(
                                  title: 'K_IMAGE_SOURCE'.tr,
                                  content: Column(
                                    children: [
                                      ListTile(
                                        onTap: () {
                                          _lookFormController
                                              .getLookImage(ImageSource.camera);
                                          Get.back();
                                        },
                                        leading: Icon(Icons.camera_alt),
                                        title: Text('K_CAMERA'.tr),
                                      ),
                                      ListTile(
                                        onTap: () {
                                          _lookFormController.getLookImage(
                                              ImageSource.gallery);
                                          Get.back();
                                        },
                                        leading: Icon(Icons.gamepad),
                                        title: Text('K_GALERY'.tr),
                                      )
                                    ],
                                  ),
                                );
                              },
                              child: Obx(() => _lookFormController
                                          .selectImagePathLook.value ==
                                      ''
                                  ? Card(
                                      shape: _lookFormController
                                                  .cardHasImage.value ==
                                              true
                                          ? RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              side: BorderSide(
                                                  style: BorderStyle.solid,
                                                  color: Colors.red,
                                                  width: 2))
                                          : null,
                                      child: Icon(
                                        Icons.camera_alt,
                                        size:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        color: Colors.grey,
                                      ),
                                    )
                                  : CardPickImage(
                                      image: _lookFormController
                                          .selectImagePathLook.value))),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: size.height * .2,
                      color: Colors.grey,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: InkWell(
                              onTap: () => Get.to(
                                ClothesView(),
                                transition: Transition.rightToLeft,
                                arguments: _lookFormController.lookClothesList,
                              ),
                              child: Container(
                                height: 100,
                                width: 100,
                                color: Colors.red,
                                child: Icon(
                                  Icons.camera_enhance,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              child: Obx(
                            () => ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  _lookFormController.lookClothesList.length,
                              shrinkWrap: true,
                              itemBuilder: (_, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                          height: size.height * 0.35,
                                          width: size.width * 0.35,
                                          child: _lookFormController
                                                  .lookClothesList.isNotEmpty
                                              ? Image.file(
                                                  File(_lookFormController
                                                      .lookClothesList[index]
                                                      .imageUri),
                                                  fit: BoxFit.fill,
                                                )
                                              : null),
                                      Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.all(padding3),
                                            child: InkWell(
                                              onTap: () => _lookFormController
                                                  .removeImage(
                                                      _lookFormController
                                                              .lookClothesList[
                                                          index]),
                                              child: CircleAvatar(
                                                radius: borderRadius12,
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .primaryColor,
                                                child: Icon(
                                                  Icons.close,
                                                  size: icon20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(height: height10),
                    Obx(() => Text(
                          'K_LOOK_COST'.tr +
                              ' : ${_lookFormController.lookCost.roundToDouble()}',
                          style: TextStyle(
                              color: Colors.black, fontSize: fontSize15),
                        )),
                    SizedBox(height: height10),
                    ExpansionTile(
                      title: Text('K_SELECT_CATEGORIES'.tr),
                      children: _lookFormController.categoryLook
                          .map(
                            (String category) => GetBuilder<LookFormController>(
                              builder: (builder) {
                                return CheckboxListTile(
                                  activeColor: Colors.grey,
                                  title: Text(category),
                                  value: builder.listCategorySelected
                                      .contains(category),
                                  onChanged: (val) =>
                                      _lookFormController.onTapCheck(category),
                                );
                              },
                            ),
                          )
                          .toList(),
                    ),
                    Obx(
                      () => Wrap(
                        spacing: 8.0,
                        children: _lookFormController.listCategorySelected
                            .map((category) => Chip(
                                  onDeleted: () {
                                    _lookFormController.onTapCheck(category);
                                  },
                                  label: Text(category),
                                  deleteIcon: Icon(Icons.clear),
                                  visualDensity: VisualDensity.compact,
                                  deleteIconColor: Colors.orange,
                                ))
                            .toList(),
                      ),
                    ),
                    SizedBox(height: height10),
                    CustomTextField(
                      border: OutlineInputBorder(),
                      maxLines: 3,
                      controller:
                          _lookFormController.textEditingControllerDescription,
                      labelText: 'K_DESCRIPTION'.tr,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    child: Text(
                      'K_RESET'.tr,
                      style: TextStyle(
                          color: TchombeColor.kGwhite,
                          fontSize: fontSize25,
                          fontWeight: FontWeight.bold),
                    ),
                    buttonFunction: _lookFormController.resetAllFields,
                  ),
                ),
                SizedBox(width: width5),
                Expanded(
                  child: CustomButton(
                      buttonColor: Theme.of(context).buttonColor,
                      child: Text(
                        'K_SAVE'.tr,
                        style: TextStyle(
                            color: TchombeColor.kGwhite,
                            fontSize: fontSize25,
                            fontWeight: FontWeight.bold),
                      ),
                      buttonFunction: _lookFormController.saveDatumInDataBase),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }

  String get titleAppBar => Get.arguments != null ? 'K_EDIT_LOOK'.tr : 'K_ADD_LOOK'.tr;
}
