import 'package:e_bandobas1/Controller/assessment_controller.dart';
import 'package:e_bandobas1/Resources/Card/Card.dart';
import 'package:e_bandobas1/Resources/drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DuttyPointAllocationView  extends GetView<AssessmentController>{
  const DuttyPointAllocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(100, 28, 54, 105),
        title: const Text('Dutty Point Allocation '),
        centerTitle: true,
      ),
      body:SizedBox(
        child:CardView,
      ),
    );
  }
}