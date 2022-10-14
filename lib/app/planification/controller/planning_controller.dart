import 'package:get/get.dart';
import 'package:intl/intl.dart';
//import 'package:sembast/sembast.dart';
import 'package:tchombe/app/planification/models/planning.dart';
import 'package:tchombe/app/planification/services/planning_repository.dart';
import 'package:tchombe/app/planification/views/planning_form.dart';
import 'package:tchombe/core/model/abstract_summary_dto.dart';

class PlanningController extends GetxController {
  PlanningRepository _planningRepository = PlanningRepository();

  RxMap<String, List<PlanningSummary>> mapList =
      RxMap<String, List<PlanningSummary>>();
  RxList<String> listOfDifferentDate = RxList<String>();
  RxList<PlanningSummary> listOfPlanningFetchInDb = <PlanningSummary>[].obs;

  RxInt planningLength = 0.obs;

  @override
  void onInit() async {
    listOfPlanningFetchInDb.value = await fetchPlanning();
    super.onInit();
  }

  getNavigationResponse() async {
    var result =
        await Get.to(() => PlanningForm(), transition: Transition.leftToRight);
    if (result == true) {
      listOfPlanningFetchInDb.value = await fetchPlanning();
    }
  }

  /// Fetch planning in SEMBAST DB
  Future<List<PlanningSummary>> fetchPlanning() async {
    List<AbstractSummaryDto<Planning>> _listOfPlanningAbstractSummaryDto =
        await _planningRepository.searchAll();//sortOrders: [SortOrder('date',false)]

    List<PlanningSummary> _listOfPlanning = [];
    for (var plan in _listOfPlanningAbstractSummaryDto) {
      _listOfPlanning.add(PlanningSummary(plan));
    }
    getListOfPlaningByDate(_listOfPlanning);
    getPlanningDate();
    return _listOfPlanning;
  }

  /// get list of plannings and thier date
  getListOfPlaningByDate(List<PlanningSummary> listOfPlanning) async {
    Map<String, List<PlanningSummary>> planningListByDate = {};
    listOfPlanning.forEach((item) {
      if (planningListByDate.containsKey(item.summary.value!.date)) {
        planningListByDate[item.summary.value!.date]!.add(item);
      } else {
        planningListByDate.putIfAbsent(item.summary.value!.date, () => [item]);
      }
    });
    mapList.value = planningListByDate;
  }

  ///  get list of planning on this day
  List<PlanningSummary> getLookOfDay(String date) {
    List<PlanningSummary> list = [];
    mapList[date]?.forEach((PlanningSummary planning) {
      list.add(planning);
    });
    return list;
  }

  ///  get the list of distinct date
  getPlanningDate() {
    List<String> dateList = [];
    mapList.keys.forEach((String date) {
      dateList.add(date);
    });
    listOfDifferentDate.value = [...dateList];
  }

  /// get list of image(s)
  List<String> getImageByDate(String date) {
    List<String> imageList = [];
    mapList[date]?.forEach((element) {
      imageList.add(element.summary.value!.lookAssociated.imageUri);
    });
    return imageList;
  }

  /// check if planning date has passed
  bool planningDateHasPassed(String date) {
    DateTime dateTime = DateFormat('d/MM/yyyy').parse(date);
    return DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .isBefore(dateTime) ||
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .isAtSameMomentAs(dateTime);
  }

  deletePlanning(String id) async {
    _planningRepository.delete(id);
    listOfPlanningFetchInDb.value = await fetchPlanning();
    Get.back(result: true);
  }
}
