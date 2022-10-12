import 'package:get/get.dart';
import 'package:tchombe/app/clothes/models/clothes.dart';
import 'package:tchombe/app/clothes/views/clothing-creation-form.dart';

class DetailClothesController extends GetxController {
  final ClothesSummary clothesSummary;

  DetailClothesController({required this.clothesSummary});

  late ClothesSummary clothes;

  @override
  void onInit() {
    clothes = clothesSummary;
    super.onInit();
  }

  getResponse() async {
    var result = await Get.to(ClothingCreationForm(), arguments: Get.arguments);

    result != null ? clothes = result : clothes = clothesSummary;
    update();
    return clothes;
  }
}
