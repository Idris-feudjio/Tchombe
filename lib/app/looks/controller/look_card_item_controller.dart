import 'package:get/get.dart';
import 'package:tchombe/app/clothes/service/clothes_repository.dart';
import 'package:tchombe/app/looks/controller/look_crud.dart';
import 'package:tchombe/app/looks/models/look.dart';
import 'package:tchombe/app/looks/service/look_repository.dart';

class LookCardItemController extends GetxController {
  FetchDisplayAndDeleteLookController _fetchDisplayAndDeleteLookController =
      Get.find<FetchDisplayAndDeleteLookController>();

  RxList<LookSummary> listOfSelectItem = <LookSummary>[].obs;
  RxList<LookSummary> listOfSelect  = <LookSummary>[].obs;
  RxInt countItemSelected = 0.obs;
  RxList<String> listOfDeletedLook = <String>[].obs;
  late LookSummary lookToPlan;

 @override
 onInit(){

   super.onInit();
 }
 @override
 onClose(){
   listOfSelectItem.clear();
   countItemSelected.value = 0;
   super.onClose();
 }

  getSelectItem(LookSummary look) {
    if (Get.arguments == null) {
      if (listOfSelectItem.contains(look)) {
        listOfSelectItem.remove(look);
        countItemSelected -= 1;
      } else {
        listOfSelectItem.add(look);
        countItemSelected += 1;
      }
    } else {
      if(listOfSelectItem.isNotEmpty){
        listOfSelectItem.clear();
        listOfSelectItem.add(look);
        lookToPlan = look;
      }else{
        listOfSelectItem.add(look);
        lookToPlan = look;
      }
    }
    update();
  }

  clearAllSelectItem() {
    listOfSelectItem.clear();
    countItemSelected = 0.obs;
    update();
  }

  deleteLook() {
    listOfSelectItem.forEach((LookSummary look) {
      _fetchDisplayAndDeleteLookController.deleteLook(look.summary.id!.toString());
    });
    listOfSelectItem.value = [];
    update();
  }

}
