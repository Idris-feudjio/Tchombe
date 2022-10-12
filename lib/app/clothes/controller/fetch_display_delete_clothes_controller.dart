import 'package:get/get.dart';
import 'package:sembast/sembast.dart';
import 'package:tchombe/app/clothes/models/clothes.dart';
import 'package:tchombe/app/clothes/service/clothes_repository.dart';
import 'package:tchombe/app/clothes/views/clothing-creation-form.dart';
import 'package:tchombe/core/model/abstract_summary_dto.dart';

class FetchDisplayAndDeleteClothesController extends GetxController {
  ClothesRepository _clothesRepository = ClothesRepository();
  RxDouble totalCostOfClothes = 0.0.obs;
  RxList<ClothesSummary> fetchListClotheInData = RxList<ClothesSummary>();
  RxInt lengthOfClothes = 0.obs;
  RxList<int> occurrenceOfType = RxList<int>();
  RxList<String> listTypeOfClothes = RxList<String>();

  @override
  void onInit() async {
    fetchListClotheInData = await fetchData();
    computeClothesCost(fetchListClotheInData);
    getClothesType(fetchListClotheInData);
    lengthOfClothes.value = fetchListClotheInData.length;

    super.onInit();
  }

  onPressNavToClothesFormPage() async {
    var result = await Get.to(() => ClothingCreationForm());
    if (result == true) {
      fetchListClotheInData = await fetchData();
    }
  }

  /// Fetch Clothes in SEMBAST DB
  Future<RxList<ClothesSummary>> fetchData() async {
    List<AbstractSummaryDto<Clothes>> _listClothes = await _clothesRepository
        .searchAll(sortOrders: [SortOrder('clothesId', false)]);
    List<ClothesSummary> list = [];
    for (var item in _listClothes) {
      list.add(ClothesSummary(item));
    }

    lengthOfClothes.value = list.length;
    getClothesType(list);

    return RxList(list);
  }

  /// Compute cost of ware robe
  computeClothesCost(List<ClothesSummary> listClothes) {
    double price = 0;
    listClothes.forEach((ClothesSummary clothes) {
      price += clothes.summary.value?.price ?? 0;
    });
    totalCostOfClothes.value = price;
  }

  /// Delete clothes
  deleteClothes(int? id) async {
    await _clothesRepository.delete(id);
    fetchListClotheInData = await fetchData();
    lengthOfClothes.value = fetchListClotheInData.length;
    computeClothesCost(fetchListClotheInData);
    getClothesType(fetchListClotheInData);
    Get.back(result: true);
  }

  /// chercher les types de vêtementes par type et calculer le nombre d'occurrence
  getClothesType(List<ClothesSummary> clothesSummary) async {
    List<String> _typeList = [];
    clothesSummary.forEach((ClothesSummary clothes) {
      _typeList.add(clothes.summary.value?.clothesType ?? '');
    });

    _typeList.forEach((element) {
      if (!listTypeOfClothes.contains(element)) {
        listTypeOfClothes.add(element);
      }
    });

    listTypeOfClothes.forEach((type) {
      occurrenceOfType.add(getOccurrenceOf(_typeList, type));
    });
  }

  /// calucl le nombre d'occurrence d'un type
  int getOccurrenceOf(List list, String type) {
    var res = list.where((element) => element == type);
    return res.length;
  }
}
