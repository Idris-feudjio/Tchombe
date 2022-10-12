import 'package:get/get.dart';
import 'package:sembast/sembast.dart';
import 'package:tchombe/app/looks/models/look.dart';
import 'package:tchombe/app/looks/service/look_repository.dart';
import 'package:built_collection/src/list.dart';
import 'package:tchombe/core/model/abstract_summary_dto.dart';

class FetchDisplayAndDeleteLookController extends GetxController {
  FetchDisplayAndDeleteLookController();

  LookRepository _lookRepository = LookRepository();

  RxList<LookSummary> listOfLookFetched = RxList<LookSummary>();
  RxInt numberOfLook = 0.obs;
  RxDouble lookCost = 0.0.obs;

  @override
  void onInit() async {
    listOfLookFetched = await fetchData();
    numberOfLook.value = listOfLookFetched.length;
    super.onInit();
  }

  Future<RxList<LookSummary>> fetchData() async {
    List<AbstractSummaryDto<Look>> _listLook =
        await _lookRepository.searchAll(sortOrders: [SortOrder('lookId')]);
    List<LookSummary> list = [];
    for (var look in _listLook) {
      list.add(LookSummary(look));
    }
    numberOfLook.value = list.length;
    update();
    return RxList(list);
  }

  deleteLook(int id) async {
    await _lookRepository.delete(id);
    listOfLookFetched = await fetchData();
    numberOfLook.value = listOfLookFetched.length;
  }
}
