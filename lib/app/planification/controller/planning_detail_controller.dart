import 'package:get/get.dart';
import 'package:tchombe/app/clothes/models/clothes.dart';
import 'package:tchombe/app/planification/models/planning.dart';

class PlanningDetailController extends GetxController {
  PlanningDetailController(this.planningSummary);

  final PlanningSummary planningSummary;

  RxString currentImage = RxString('');
  RxList<String> imageList = <String>[].obs;

  @override
  void onInit() {
    currentImage.value = planningSummary.summary.value!.lookAssociated.imageUri;
    getLookImage();
    super.onInit();
  }

  getLookImage() {
    List<String> _list = [];
    planningSummary.summary.value!.lookAssociated.listOfClothes!
        .forEach((Clothes clothes) {
      _list.add(clothes.imageUri);
    });
    _list.insert(0, planningSummary.summary.value!.lookAssociated.imageUri);
    imageList.value = [..._list];
  }

  changeCurrentImage(String newImage) {
    currentImage.value = newImage;
  }
}
