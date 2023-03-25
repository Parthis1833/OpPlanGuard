import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import '../../jsondata/EventPoliceCount/EventPoliceCountOfAssignedTotalRequestedModel.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class PoliceCardV2 extends StatelessWidget {
  
  double responsiveHeight(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width > 950) {
      return 200;
    } else if (width > 850) {
      return 400;
    } else if (width > 800) {
      return 400;
    } else if (width >= 600) {
      return 600;
    } else if (width <= 600 && width > 480) {
      return 600;
    }
    // all phones
    else {
      return 850;
    }
  }
  PoliceCardV2({super.key, required this.eventAssignments});
  List<EventPoliceCountAssignedTotalRequestedModel> eventAssignments;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:360,
      color: const Color.fromARGB(128, 73, 89, 110),
      child: ResponsiveGridList(
          horizontalGridMargin: 0,
          verticalGridMargin: 6,
          minItemWidth: 145,
          children: generateListOfAssignmentBox()),
    );
  }

  List<Widget> generateListOfAssignmentBox() {
    return List.generate(
        eventAssignments.length,
        (index) => assignmentBoxWidget(index));
  }

  Widget assignmentBoxWidget(int index) {
    return SizedBox(
      height: 160,
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.white, //<-- SEE HERE
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        margin: const EdgeInsets.all(1),
        color: Colors.grey,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.only(top: 65),
              child: Center(
                  child: Text(eventAssignments[index].designationName ?? "",
                      style: const TextStyle(fontSize: 16))),
            ),
            Container(
              height: 45,
              padding: const EdgeInsets.only(top: 25),
              alignment: Alignment.bottomCenter,
              child: AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    "Assigned ${eventAssignments[index].assignedCount}",
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                  ColorizeAnimatedText(
                    "Requested ${eventAssignments[index].totalAskedCount}",
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                  ColorizeAnimatedText(
                    "Total ${eventAssignments[index].totalPoliceCount}", 
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                ],
                isRepeatingAnimation: true,
                repeatForever: true
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
const colorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

const colorizeTextStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: 'Horizon',
);
