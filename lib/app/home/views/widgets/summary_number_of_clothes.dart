import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchombe/app/clothes/controller/fetch_display_delete_clothes_controller.dart';
import 'package:tchombe/themes/tchombe_colors.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class SummaryNumberOfClothesByType extends StatelessWidget {
  final FetchDisplayAndDeleteClothesController
      _fetchDisplayAndDeleteClothesController =
      Get.put(FetchDisplayAndDeleteClothesController());
  //Get.find<FetchDisplayAndDeleteClothesController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return SliverToBoxAdapter(
      child: Container(
          height: orientation == Orientation.portrait
              ? size.height * .132
              : size.height * .25,
          child: Obx(
            () => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _fetchDisplayAndDeleteClothesController
                    .listTypeOfClothes.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(padding8),
                    child: Column(
                      children: [
                        Chip(
                            backgroundColor: TchombeColor.K_button[
                                300], //Theme.of(context). accentColor[6],
                            label: Text(
                              _fetchDisplayAndDeleteClothesController
                                  .listTypeOfClothes[index].tr,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        Text(
                            '${_fetchDisplayAndDeleteClothesController.occurrenceOfType[index]}')
                      ],
                    ),
                  );
                }),
          )),
    );
  }
}
