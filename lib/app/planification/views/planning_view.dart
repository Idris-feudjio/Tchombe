import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchombe/app/home/views/widgets/drawer.dart';
import 'package:tchombe/app/planification/controller/planning_card_controller.dart';
import 'package:tchombe/app/planification/controller/planning_controller.dart';
import 'package:tchombe/app/planification/views/widgets/planning_card.dart';
import 'package:tchombe/core/widgets/background/custom_background_image.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class PlanningView extends StatelessWidget {
  static final String routeName = '/planning';
  PlanningController get _planningController => Get.put(PlanningController());
  final PlanningCardItemController _planningCardItemController =
      Get.put(PlanningCardItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        leadingWidth: leadingWidth30,
        title: Obx(
          () => _planningCardItemController.listOfPlanning.isEmpty
              ? Text('K_PLANNING'.tr)
              : Row(
                  children: [
                    IconButton(
                        onPressed:
                            _planningCardItemController.clearSelectedItems,
                        icon: Icon(Icons.close)),
                    SizedBox(width: width10),
                    Text('${_planningCardItemController.countSelectedPlanning}')
                  ],
                ),
        ),
        actions: [
          Obx(() => _planningCardItemController.listOfPlanning.isNotEmpty
              ? IconButton(
                  onPressed: _planningCardItemController.deletePlanning,
                  icon: Icon(
                    Icons.delete_forever,
                    size: icon30,
                  ))
              : Container())
        ],
      ),
      body: CustomBackgroundImage(
        child: RefreshIndicator(
            onRefresh: () async => await _planningController.fetchPlanning(),
            child: Obx(
              () => ListView.builder(
                  itemCount: _planningController.listOfDifferentDate.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (_, index) {
                    return ContentTimelinePlanning(
                      planningSummary: _planningController.getLookOfDay(
                          _planningController.listOfDifferentDate[index]),
                      date: _planningController.listOfDifferentDate[index],
                      imageList: _planningController.getImageByDate(
                        _planningController.listOfDifferentDate[index],
                      ),
                      planningDateHasPassed:
                          _planningController.planningDateHasPassed(
                              _planningController.listOfDifferentDate[index]),
                    );
                  }),
            )),
      ),
      drawer: MainDrawer(),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Theme.of(context).colorScheme.secondary,
            textStyle: TextStyle(fontWeight: FontWeight.bold)),
        onPressed: _planningController.getNavigationResponse,
        child: Text(
          'K_PLAN_LOOK'.tr,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
