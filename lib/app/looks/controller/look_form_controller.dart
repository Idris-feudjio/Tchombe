import 'package:built_collection/src/list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tchombe/app/clothes/models/clothes.dart';
import 'package:tchombe/app/looks/controller/look_crud.dart';
import 'package:tchombe/app/looks/models/look.dart';
import 'package:tchombe/app/looks/service/look_repository.dart';
import 'package:tchombe/core/functions/open_snackbar.dart';
import 'package:tchombe/themes/tchombe_colors.dart';

class LookFormController extends GetxController {
  FetchDisplayAndDeleteLookController _fetchDisplayAndDeleteLookController =
      Get.find<FetchDisplayAndDeleteLookController>();

  final textEditingControllerDescription = TextEditingController();

  LookRepository _lookRepository = LookRepository();

  RxBool cardHasImage = false.obs;

  bool get isUpdate => Get.arguments != null;

  RxList<Clothes> lookClothesList = RxList<Clothes>();
  RxDouble lookCost = 0.0.obs;
  RxList<String> imagesList = <String>[].obs;

  void onClose() {
    textEditingControllerDescription.dispose();
    super.onClose();
  }

  @override
  void onInit() async {
    if (isUpdate) editLookTextField();
    super.onInit();
  }

  /// CLEAR ALL FIELDS
  resetAllFields() {
    textEditingControllerDescription.clear();
    selectImagePathLook.value = "";
    listCategorySelected.clear();
    lookCost = 0.0.obs;
    lookClothesList.clear();
  }

  ///  IMPROVE IMAGE
  var selectImagePathLook = ''.obs;
  var selectImagePathSize = ''.obs;

  getLookImage(ImageSource imageSource) async {
    var path = await CoreFunction.pickImageAt(imageSource);
    if (path != null) {
      selectImagePathLook.value = path;
    } else {
      CoreFunction.openSnackBar('K_ERROR'.tr, 'K_NO_IMAGE_PICKER'.tr,
          colorText: TchombeColor.K_red);
    }
  }

  /// EDIT TEXT FIELD
  editLookTextField() async {
    textEditingControllerDescription.text =
        Get.arguments!.summary.value!.description!;
    selectImagePathLook.value = Get.arguments!.summary.value!.imageUri;
    listCategorySelected =
        RxList<String>(Get.arguments!.summary.value!.listOfCategory.toList());
    lookCost.value = Get.arguments!.summary.value!.costOfALook!;
    lookClothesList.value =
        RxList<Clothes>(Get.arguments!.summary.value!.listOfClothes!.toList());
  }

  ///  SAVE IN DATABASE
  saveDatumInDataBase() async {
    Look item = Look((D) => D
      ..lookId = DateFormat().format(DateTime.now())
      ..imageUri = selectImagePathLook.value
      ..listOfCategory = ListBuilder<String>(listCategorySelected)
      ..listOfClothes = ListBuilder<Clothes>(lookClothesList)
      ..description = textEditingControllerDescription.text
      ..costOfALook = double.tryParse(lookCost.toString()));
    if (selectImagePathLook.value != '') {
      if (isUpdate) {
        await _lookRepository.update(item, Get.arguments!.summary.id!);
        _fetchDisplayAndDeleteLookController.listOfLookFetched =
            await _fetchDisplayAndDeleteLookController.fetchData();
        Get.back(
            result:
                _fetchDisplayAndDeleteLookController.listOfLookFetched.last);
        CoreFunction.openSnackBar('K_SUCCES'.tr, 'K_EDIT_SUCCEFULL'.tr);
      } else {
        await _lookRepository.insert(item);
        _fetchDisplayAndDeleteLookController.listOfLookFetched =
            await _fetchDisplayAndDeleteLookController.fetchData();
        Get.back();
        CoreFunction.openSnackBar('K_SUCCES'.tr, 'K_CREATE_SUCCEFULL'.tr);
      }
      resetAllFields();
    } else {
      cardHasImage.value = true;
    }
  }

  /// MAGIC FUNCTION :: GO TO CLOTHES VIEW AN SELECT !!!!!!!

  getListClothesLook(List<ClothesSummary> clothesList) {
    clothesList.forEach((ClothesSummary clothes) {
      if (lookClothesList.contains(clothes)) {
        lookClothesList.remove(clothes.summary.value!);
        lookCost.value -= clothes.summary.value!.price!;
      } else {
        lookClothesList.add(clothes.summary.value!);
        lookCost.value += clothes.summary.value!.price!;
      }
    });
  }

  removeImage(Clothes clothes) {
    lookClothesList.remove(clothes);
    lookCost.value -= clothes.price!;
  }

  /// LIST OF TYPE OF CLOTHES
  final List<String> categoryLook = [
    'K_WORK'.tr,
    'K_EVENING'.tr,
    'K_MARIAGE'.tr,
    'K_OUTSIDE'.tr,
    'K_CLASS'.tr,
    'K_HOUSE'.tr,
    'K_HOLLY_DAY'.tr,
    'K_OTHER'.tr,
  ];

  /// CHECK SELECTED CATEGORIES
  RxList<String> listCategorySelected = <String>[].obs;

  onTapCheck(String category) {
    if (listCategorySelected.contains(category)) {
      listCategorySelected.remove(category);
    } else {
      listCategorySelected.add(category);
    }
    update();
  }
}
