import 'package:get/get.dart';
import '../../../Controller/assessment_controller.dart';

class AssessmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AssessmentController>(
      AssessmentController(),
    );
  }
}
