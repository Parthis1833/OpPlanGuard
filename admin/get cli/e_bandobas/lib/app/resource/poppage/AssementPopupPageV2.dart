import 'package:e_bandobas/app/jsondata/DesignationData/Designation.dart';
import 'package:e_bandobas/app/jsondata/DesignationData/DesignationApi.dart';
import 'package:e_bandobas/app/jsondata/EventData/Event.dart';
import 'package:e_bandobas/app/jsondata/EventData/EventApi.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

// This widget works like, first it will load all the designations,
// then it will load all events available to be selected in drop down box to select.

// work under progress
class AssementPopupPageV2 extends StatefulWidget {
  AssementPopupPageV2({super.key});

  @override
  State<AssementPopupPageV2> createState() => _AssementPopupPageV2State();
}

class _AssementPopupPageV2State extends State<AssementPopupPageV2> {
  late List<Designation> designations;
  late List<Event> events;
  bool isDesignationsLoading = true;
  bool isEventsLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadDesignations();
    _loadEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isDesignationsLoading && isEventsLoading
          ? const CircularProgressIndicator()
          : dataWidget(),
    );
  }

  Widget dataWidget() {
    return ListView.builder(
      itemCount: designations.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 160.0),
              padding: const EdgeInsets.only(top: 25.0),
              child: Text(
                designations[index].name.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black38,
                    fontSize: 26.0),
              ),
            ),


          ],
        );
      },
    );
  }

  void _loadDesignations() async {
    List<Designation> obtainedDesignations =
        await DesignationApi.obtainDesignations(API_Decision.Only_Failure);
    setState(() {
      designations = obtainedDesignations;
      isDesignationsLoading = false;
    });
  }

  void _loadEvents() async {
    List<Event> obtainedEvents =
        await EventApi.obtainEvents(API_Decision.Only_Failure);
    setState(() {
      events = obtainedEvents;
      isEventsLoading = false;
    });
  }
}
