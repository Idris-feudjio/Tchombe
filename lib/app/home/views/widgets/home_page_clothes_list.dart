import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchombe/app/clothes/controller/fetch_display_delete_clothes_controller.dart';
import 'package:tchombe/app/clothes/views/clothes_page.dart';
import 'package:tchombe/app/clothes/views/detail_clothes_view.dart';
import 'package:tchombe/app/home/views/widgets/custom_card.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

FetchDisplayAndDeleteClothesController _fetchDisplayAndDeleteClothesController =
    Get.find<FetchDisplayAndDeleteClothesController>();

class HomepageClothesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

    return SliverToBoxAdapter(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => Text(
                  'K_CLOTHES'.tr +
                      ' (${_fetchDisplayAndDeleteClothesController.lengthOfClothes.value})',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: fontSize20))),
              IconButton(
                onPressed: () =>
                    Get.offNamedUntil(ClothesPage.routeName, (route) => true),
                icon: Icon(Icons.queue_play_next_rounded),
              )
            ],
          ),
        ),
        Container(
            height: orientation == Orientation.portrait
                ? size.height * .3
                : size.height * .5,
            child: Obx(() => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _fetchDisplayAndDeleteClothesController
                      .lengthOfClothes.value,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(padding5),
                      child: CustomCard(
                          _fetchDisplayAndDeleteClothesController
                                  .fetchListClotheInData[index]
                                  .summary
                                  .value
                                  ?.imageUri ??
                              '',
                          _fetchDisplayAndDeleteClothesController
                                  .fetchListClotheInData[index]
                                  .summary
                                  .value
                                  ?.brand ??
                              '', () {
                        Get.toNamed(DetailClothesView.routeName,
                            arguments: _fetchDisplayAndDeleteClothesController
                                .fetchListClotheInData[index]);
    }),
                    );
                  },
                ))),
      ],
    ));
  }
}
