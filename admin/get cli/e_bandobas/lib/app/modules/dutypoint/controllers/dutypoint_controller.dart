import 'dart:convert';
import 'package:e_bandobas/app/jsondata/PointData/Point.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../Api/API.dart';

class DutypointController extends GetxController {
  final count = 0.obs;
  void increment() => count.value++;
  List<Point> pointListFromContent = [];



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
}
