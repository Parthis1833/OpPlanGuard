import 'package:get/get.dart';

class CounterController extends GetxController {
  //TODO: Implement CounterController

  final count = 0.obs;



  void increment() => count.value++;
}
