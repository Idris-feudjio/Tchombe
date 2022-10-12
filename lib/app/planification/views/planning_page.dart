import 'package:flutter/material.dart';
import 'package:tchombe/app/planification/views/planning_view.dart';

class PlanningPage extends StatelessWidget {
  const PlanningPage({Key? key}) : super(key: key);

  static final String rootName = '/planningPage';

  @override
  Widget build(BuildContext context) {
    return PlanningView();
  }
}
