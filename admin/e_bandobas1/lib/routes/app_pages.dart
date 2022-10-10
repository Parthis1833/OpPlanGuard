import 'package:e_bandobas1/Views/assessment_view.dart';
import 'package:e_bandobas1/Views/counter_view.dart';
import 'package:e_bandobas1/Views/duttypointallocation_view.dart';
import 'package:e_bandobas1/Views/dutypoint_view.dart';
import 'package:e_bandobas1/screens/Assessment/bindings/assessment_binding.dart';
import 'package:e_bandobas1/screens/OfficersData/officersdata.dart';
import 'package:e_bandobas1/screens/PointList/pointlist.dart';
import 'package:e_bandobas1/screens/RoadBandobast/roadbandobast.dart';
import 'package:e_bandobas1/screens/Settings/settings.dart';
import 'package:e_bandobas1/screens/ZoneList/zonelist.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.assessment;

  static final routes = [
    GetPage(
      name: _Path.assessment,
      page: () => const AssessmentView(),
      binding: AssessmentBinding(),
    ),
    GetPage(
      name: _Path.counter,
      page: () => const CounterView(),
    ),
    GetPage(
      name: _Path.duttyPoint,
      page: () => const DutypointView(),
    ),
    GetPage(
      name: _Path.duttyPointAllocation,
      page: () => const DuttyPointAllocationView(),
    ),
    GetPage(
      name: _Path.officersData,
      page: () => const OfficersData(),
    ),
    GetPage(
      name: _Path.roadBandobast,
      page: () => const RoadBandobast(),
    ),
    GetPage(
      name: _Path.settings,
      page: () => const Settings(),
    ),
    GetPage(name: _Path.pointList, page: () => const PointList()),
    GetPage(name: _Path.zoneList, page:() => const ZoneList(),)
  ];
}
