import 'package:e_bandobas1/Resources/Button/AssessmentButton.dart';
import 'package:e_bandobas1/Resources/Card/PoliceCard.dart';
import 'package:e_bandobas1/Resources/drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/assessment_controller.dart';
class AssessmentView extends GetView<AssessmentController> {
  const AssessmentView({super.key});
  double responsiveHeight(BuildContext context){
    double width = MediaQuery.of(context).size.width;
    if(width > 950){
      return 200;
    }
    else if(width > 900){
      return 400;
    }
    else if (width >= 610 && width <= 890){
      return 400;
    }
   else if( width >= 600){
     return 600;
    }
    else if(width <= 640 && width > 400){
      return 600;
    }
    // all phones
    else{
      return 850;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(100, 28, 54, 105),
        title: const Text('Assessment '),
        centerTitle: true,
      ),
      body:
g


      floatingActionButton: AssesmentButton(),
    );
  }
}
