import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tchombe/app/clothes/controller/clothes_form_controller.dart';
import 'package:tchombe/app/clothes/models/clothes.dart';
import 'package:tchombe/app/type_of_clothes/model/type-clothes.dart';
import 'package:tchombe/core/widgets/background/custom_background_image.dart';
import 'package:tchombe/core/widgets/button/custom_button.dart';
import 'package:tchombe/core/widgets/card/card_pick_image.dart';
import 'package:tchombe/core/widgets/dropdown/custom_dropdown.dart';
import 'package:tchombe/core/widgets/textfield/textfield.dart';
import 'package:tchombe/themes/tchombe_colors.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class ClothingCreationForm extends StatelessWidget {
  ClothingCreationForm();

  ClothesFormController get _clothesFormController =>
      Get.put(ClothesFormController()); //clothes: clothes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: leadingWidth30,
        leading: IconButton(
            onPressed: () => Get.back(), icon: Icon(Icons.arrow_back)),
        title: Text(titleAppBar),
      ),
      body: CustomBackgroundImage(
        child: Padding(
          padding: EdgeInsets.all(padding8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _clothesFormController.formKey,
                    child: Column(
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
                                                _clothesFormController
                                                    .getClothesImage(
                                                        ImageSource.camera);
                                                Get.back();
                                              },
                                              leading: Icon(Icons.camera_alt),
                                              title: Text('K_CAMERA'.tr),
                                            ),
                                            ListTile(
                                              onTap: () {
                                                _clothesFormController
                                                    .getClothesImage(
                                                        ImageSource.gallery);
                                                Get.back();
                                              },
                                              leading: Icon(Icons.gamepad),
                                              title: Text('K_GALERY'.tr),
                                            )
                                          ],
                                        ));
                                  },
                                  child: Obx(() => _clothesFormController
                                              .selectImagePath.value ==
                                          ''
                                      ? Card(
                                          shape: _clothesFormController
                                                      .cardHasClothesImage
                                                      .value ==
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
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.4,
                                            color: Colors.grey,
                                          ),
                                        )
                                      : CardPickImage(
                                          image: _clothesFormController
                                              .selectImagePath.value))),
                            )
                          ],
                        ),
                        SizedBox(height: height10),
                        CustomTextField(
                            labelText: 'K_CLOTHES_NAME'.tr,
                            controller: _clothesFormController
                                .textEditingControllerClothesName,
                            validator: (String? value) =>
                                _clothesFormController.verifyIfIisEmpty(value),
                            hintText: 'K_CLOTHES_NAME'.tr),
                        SizedBox(height: height10),
                        GetBuilder<ClothesFormController>(
                            builder: (clothesFormController) {
                          return CustomDropDown(
                            clothesFormController.selectTypeClothes,
                            'K_SELECT_TYPE'.tr,
                            TypeEnumClothesExtension.listTypeClothes.map((e) => e.tr).toList(),
                            clothesFormController.onSelectDropDown,
                          );
                        }),
                        CustomTextField(
                            labelText: 'K_BRAND'.tr,
                            controller: _clothesFormController
                                .textEditingControllerBrand,
                            validator: (String? value) =>
                                _clothesFormController.verifyIfIisEmpty(value),
                            hintText: 'K_BRAND'.tr),
                        SizedBox(height: height10),
                        CustomTextField(
                            labelText: 'K_COLOR'.tr,
                            controller: _clothesFormController
                                .textEditingControllerColor,
                            validator: (String? value) =>
                                _clothesFormController.verifyIfIisEmpty(value),
                            hintText: 'K_COLOR'.tr),
                        SizedBox(height: height10),
                        CustomTextField(
                            labelText: 'K_PRICE'.tr,
                            controller: _clothesFormController
                                .textEditingControllerPrice,
                            validator: (String? value) =>
                                _clothesFormController.verifyIfIisNumber(value),
                            hintText: 'K_PRICE'.tr,
                            keyboardType: TextInputType.number),
                        SizedBox(height: height10),
                        CustomTextField(
                          labelText: 'K_DESCRIPTION'.tr,
                          controller: _clothesFormController
                              .textEditingControllerDescription,
                          validator: (String? value) =>
                              _clothesFormController.verifyIfIisEmpty(value),
                          hintText: 'K_DESCRIPTION'.tr,
                          maxLines: 3,
                          border: OutlineInputBorder(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(padding10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: CustomButton(
                          child: Text(
                            'K_RESET'.tr,
                            style: TextStyle(
                                color: TchombeColor.kGwhite,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          buttonFunction:
                              _clothesFormController.resetAllFields),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: CustomButton(
                          buttonColor: Theme.of(context).buttonColor,
                          child: Text(
                            saveText,
                            style: TextStyle(
                                color: TchombeColor.kGwhite,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          buttonFunction:
                              _clothesFormController.saveDatumInDataBase),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String get titleAppBar =>
      Get.arguments != null ? 'K_EDIT_CLOTHES'.tr : 'K_ADD_CLOTHES'.tr;

  String get saveText => Get.arguments != null ? 'K_SAVE'.tr : 'K_CREATE'.tr;
}
