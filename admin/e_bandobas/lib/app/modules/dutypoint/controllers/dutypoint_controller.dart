import 'dart:async';
import 'dart:convert';
import 'package:e_bandobas/app/Exceptions/ValidationException.dart';
import 'package:e_bandobas/app/jsondata/PointData/Point.dart';
import 'package:e_bandobas/app/jsondata/PointData/PointApi.dart';
import 'package:e_bandobas/app/jsondata/ZoneData/Zone.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:e_bandobas/utils/text_utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../Api/API.dart';
import '../../../jsondata/ZoneData/ZoneApi.dart';
import '../views/pointview.dart';

class DutypointController extends GetxController {
  final count = 0.obs;
  void increment() => count.value++;
  List<Point> pointListFromContent = [];

  final zoneList = Rxn<List<Zone>>();
  final pointList = Rxn<List<Point>>();
  final selectZoneId = 0.obs;
  final pointDataSource = Rxn<PointDetailViewDataGridSource>();

  Future<List<Point>> getPointDataSource() async {
    var response = await http.get(Uri.parse(APIConstants.POINT_URL));
    var decodedPoint = jsonDecode(utf8.decode(response.bodyBytes));
    if (decodedPoint['content'] != null) {
      decodedPoint['content'].forEach((pointData) {
        pointListFromContent.add(Point.fromJson(pointData));
      });
    }
    pointListFromContent[0];
    return pointListFromContent;
  }

  @override
  void onInit() {
    super.onInit();
    loadPoints();
    loadZones();
  }

  void loadPoints() async {
    pointList.value = await PointApi.obtainPoints(API_Decision.Only_Failure);
    if (pointList.value != null && pointList.value!.isNotEmpty) {
      pointDataSource.value = PointDetailViewDataGridSource(pointList.value!);
    }
    pointList.refresh();
    pointDataSource.refresh();
    update();
  }

  void loadZones() async {
    zoneList.value = await ZoneApi.obtainZones(API_Decision.Only_Failure);
    if (zoneList.value != null && zoneList.value!.isNotEmpty) {
      selectZoneId.value = zoneList.value!.elementAt(0).id!.toInt();
    }
    zoneList.refresh();
    update();
  }

  Future<bool> savePoint(
    String taluka,
    String district,
    String pointName,
    String accessories,
    String remarks,
  ) async {
    if (TextUtils.isEmpty(taluka) ||
        TextUtils.isEmpty(district) ||
        TextUtils.isEmpty(pointName) ||
        TextUtils.isEmpty(accessories) ||
        TextUtils.isEmpty(remarks)) {
      throw ValidationException(cause: "Some fields are required")
          .showValidationSnackBar();
    }
    if (zoneList.value != null && zoneList.value!.length > 0) {
      bool result = await PointApi.createPoint(API_Decision.BOTH, taluka,
          district, pointName, accessories, remarks, selectZoneId.value);
      if (result) {
        loadPoints();
        return true;
      } else {
        throw ValidationException(cause: "Point could not be saved ")
            .showValidationSnackBar();
      }
    } else {
      throw ValidationException(cause: "Zone data is not available")
          .showValidationSnackBar();
    }
  }

  Future<PointDetailViewDataGridSource?> getPointViewDataGridSource() async {
    print(pointList.value?.length ?? "0");
    if (pointList.value != null && pointList.value!.isNotEmpty) {
      pointDataSource.value = PointDetailViewDataGridSource(pointList.value!);
      print(pointList.value!.length);
      return pointDataSource.value;
    }
    return null;
  }
}
