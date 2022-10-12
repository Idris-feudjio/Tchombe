import 'package:get/get.dart';
import 'package:tchombe/app/clothes/models/clothes.dart';
import 'package:tchombe/app/looks/models/look.dart';
import 'package:tchombe/app/looks/views/look_form.dart';

class LookDetailController extends GetxController {
  LookDetailController({this.lookSummary, this.lookPlan});

  final LookSummary? lookSummary;
  final Look? lookPlan;

  late LookSummary look;

  RxString currentImage = RxString('');

  RxList<String> imageList = RxList<String>();
  RxList<Clothes> listOkClothesLook = RxList<Clothes>();

  @override
  void onInit() {
    look = lookSummary!;
    currentImage.value = lookSummary!.summary.value!.imageUri;
    getImageList();
    super.onInit();
  }

  getImageList() {
    List<String> list = [];
    List<Clothes> listClothes = [];
    lookSummary!.summary.value!.listOfClothes!.forEach((Clothes clothes) {
      list.add(clothes.imageUri);
      listClothes.add(clothes);
    });
    list.insert(0, lookSummary!.summary.value!.imageUri);
    listOkClothesLook.value = listClothes;
    imageList.value = [...list];
  }

  changeCurrentImage(String newImage) {
    currentImage.value = newImage;
  }

  getResponseAfterLookEdit() async {
    var result = await Get.to(LookCreationForm(), arguments: Get.arguments);
    result != null ? look = result : look = lookSummary!;
    update();
    return look;
  }
}
