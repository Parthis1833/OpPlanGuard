import 'package:e_bandobas1/Resources/Card/PoliceCard.dart';
import 'package:e_bandobas1/Resources/drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/assessment_controller.dart';

class RoadBandobastView extends GetView<AssessmentController> {
  const RoadBandobastView({super.key});
  double responsiveHeight(BuildContext context){
    double width = MediaQuery.of(context).size.width;
    if(width > 950){
      return 200;
    }
    else if(width > 900){
      return 400;
    }
    else if (width > 800){
      return 400;
    }
    else if( width >= 600){
      return 600;
    }
    else if(width <= 600 && width > 480){
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
        title: const Text('Road Bandobast '),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            height: responsiveHeight(context),
            child: PolicCard(
              margin: const EdgeInsets.all(8),
              color: Colors.grey,
              child: const Align(
                child: Text(''),
              ),
            ),
          ),
          Container(
            child: const Text('hey'),
          ),
        ],
      ),

    );
  }
}
