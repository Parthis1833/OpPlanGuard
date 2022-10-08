part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const assessment = _Path.assessment;
  static const counter = _Path.counter;
  static const duttPoint = _Path.duttyPoint;
  static const duttyPointAllocation = _Path.duttyPointAllocation;
  static const officersData = _Path.officersData;
  static const roadBandobast = _Path.roadBandobast;
  static const settings = _Path.settings;
}

abstract class _Path {
  static const assessment = '/screens/Assessment';
  static const counter = '/screens/Counter';
  static const duttyPoint = '/screens/DuttyPoint';
  static const duttyPointAllocation = '/screens/DutyPointAllocation';
  static const officersData = '/screens/OfficersData';
  static const roadBandobast = '/screens/RoadBandobast';
  static const settings = '/screens/Settings';
}
