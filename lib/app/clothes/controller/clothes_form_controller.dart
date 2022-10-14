import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tchombe/app/clothes/controller/fetch_display_delete_clothes_controller.dart';
import 'package:tchombe/app/clothes/models/clothes.dart';
import 'package:tchombe/app/clothes/service/clothes_repository.dart';
import 'package:tchombe/core/functions/open_snackbar.dart';
import 'package:tchombe/themes/tchombe_colors.dart';

class ClothesFormController extends GetxController {
  ClothesRepository _clothesRepository = ClothesRepository();

  FetchDisplayAndDeleteClothesController
      _fetchDisplayAndDeleteClothesController =
      Get.find<FetchDisplayAndDeleteClothesController>();

  final textEditingControllerBrand = TextEditingController();
  final textEditingControllerClothesName = TextEditingController();
  final textEditingControllerColor = TextEditingController();
  final textEditingControllerPrice = TextEditingController();
  final textEditingControllerDescription = TextEditingController();

  final formKey = GlobalKey<FormState>();
  var selectImagePath = ''.obs;
  String? selectTypeClothes;
  RxList<Clothes> listOfClothes = RxList<Clothes>();
  RxDouble totalCostOfClothes = 0.0.obs;
  RxBool cardHasClothesImage = false.obs;

  bool get isUpdate => Get.arguments?.summary.value != null;

  @override
  void onInit() async {
    super.onInit();
    if (isUpdate) editClotheTextField();
  }

  @override
  void dispose() {
    _disposeTextControl();
    super.dispose();
  }

  @override
  void onClose() {
    _disposeTextControl();

    super.onClose();
  }

  void _disposeTextControl() {
    textEditingControllerBrand.dispose();
    textEditingControllerColor.dispose();
    textEditingControllerPrice.dispose();
    textEditingControllerDescription.dispose();
    textEditingControllerClothesName.dispose();
    selectImagePath = ''.obs;
  }

  /// CLEAR ALL FIELDS
  resetAllFields() {
    cardHasClothesImage.value = false;
    textEditingControllerBrand.clear();
    textEditingControllerColor.clear();
    selectImagePath.value = "";
    selectTypeClothes = null;
    textEditingControllerPrice.clear();
    textEditingControllerDescription.clear();
    textEditingControllerClothesName.clear();
  }

  ///  IMPROVE IMAGE
  getClothesImage(ImageSource imageSource) async {
    var imagePath = await CoreFunction.pickImageAt(imageSource);
    if (imagePath != null) {
      selectImagePath.value = imagePath;
    } else {
      CoreFunction.openSnackBar('K_ERROR'.tr, 'K_NO_IMAGE_PICKER'.tr,
          colorText: TchombeColor.K_red);
    }
  }

  /// EDIT TEXT FIELD
  editClotheTextField() {
    textEditingControllerBrand.text = Get.arguments!.summary.value!.brand;
    textEditingControllerColor.text = Get.arguments!.summary.value!.color!;
    selectImagePath.value = Get.arguments!.summary.value!.imageUri;
    selectTypeClothes = Get.arguments!.summary.value!.clothesType;
    textEditingControllerPrice.text =
        Get.arguments!.summary.value!.price.toString();
    textEditingControllerDescription.text =
        Get.arguments!.summary.value!.clothesDescription!;
    textEditingControllerClothesName.text =
        Get.arguments!.summary.value!.clothesName;
  }

  ///  SAVE IN DATABASE
  saveDatumInDataBase() async {
    Clothes item = Clothes((D) => D
      ..clothesId = DateFormat().format(DateTime.now())
      ..imageUri = selectImagePath.value
      ..clothesType = selectTypeClothes
      ..brand = textEditingControllerBrand.text
      ..color = textEditingControllerColor.text
      ..price = double.tryParse(textEditingControllerPrice.text)
      ..clothesDescription = textEditingControllerDescription.text
      ..clothesName = textEditingControllerClothesName.text);

    if (formKey.currentState!.validate()) {
      if (isUpdate) {
        await _clothesRepository.update(item, Get.arguments!.summary.id!);
        _fetchDisplayAndDeleteClothesController.fetchListClotheInData =
            await _fetchDisplayAndDeleteClothesController.fetchData();
        _fetchDisplayAndDeleteClothesController.computeClothesCost(
            _fetchDisplayAndDeleteClothesController.fetchListClotheInData);
        ClothesSummary currentChange = _fetchDisplayAndDeleteClothesController.fetchListClotheInData.last;
        Get.back(result: currentChange);
        CoreFunction.openSnackBar('K_SUCCES'.tr, 'K_EDIT_SUCCEFULL'.tr);
      } else {
        await _clothesRepository.insert(item);

        _fetchDisplayAndDeleteClothesController.fetchListClotheInData =
            await _fetchDisplayAndDeleteClothesController.fetchData();
        _fetchDisplayAndDeleteClothesController.computeClothesCost(
            _fetchDisplayAndDeleteClothesController.fetchListClotheInData);
        Get.back(result: true);
        CoreFunction.openSnackBar('K_SUCCES'.tr, 'K_CREATE_SUCCEFULL'.tr);
      }
      resetAllFields();
    } else {
      cardHasClothesImage.value = true;
    }
    update();
  }

  deleteClothes(String id) async {
    _clothesRepository.delete(id);
    _fetchDisplayAndDeleteClothesController.fetchListClotheInData =
        await _fetchDisplayAndDeleteClothesController.fetchData();
    update();
  }

  String? verifyIfIisEmpty(String? value) {
    return value!.isEmpty &&
            /*  textEditingControllerDescription.text.isEmpty&&
        textEditingControllerClothesName.text.isEmpty&&
        textEditingControllerBrand.text.isEmpty&&
        textEditingControllerColor.text.isEmpty&&
        textEditingControllerPrice.text.isEmpty&&*/
            selectTypeClothes != null
        // selectImagePath.value.isNotEmpty
        ? 'K_CANNOT_EMPTY'.tr
        : null;
  }

  String? verifyIfIisNumber(String? value) {
    return !isNumeric(value) ? 'K_CAN_BE_NUMERIC'.tr : null;
  }

  bool isNumeric(value) => value != null && double.tryParse(value) != null;

  ///  CONTROLLER TYPE OF CLOTHES : select type in drop down

  onSelectDropDown(value) {
    selectTypeClothes = value;
    update();
  }
}
