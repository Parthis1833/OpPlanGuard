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
  var designationTextEditingControllers = <TextEditingController>[];

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
          : popUpPageDataWidget(),
    );
  }

  Widget popUpPageDataWidget() {
    return ListView(
      children: [
        eventSelectionDropDownWidget(),
        designationListWidget(),
        saveCancelContainerRow()
      ],
    );
  }

  Widget designationListWidget() {
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
            SizedBox(
              height: 45,
              width: 120,
              child: TextField(
                controller: designationTextEditingControllers[index],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 3, color: Colors.lightBlueAccent),
                  ),
                  hintText: '',
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget saveCancelContainerRow() {
    return Container(
      alignment: FractionalOffset.center,
      width: 580,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: 150,
            height: 36,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ),
          SizedBox(
            width: 150,
            height: 36,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
              ),
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget eventSelectionDropDownWidget() {
    return Container();
  }

  void _loadDesignations() async {
    List<Designation> obtainedDesignations =
        await DesignationApi.obtainDesignations(API_Decision.Only_Failure);
    for (var i in obtainedDesignations) {
      var textEditingController = TextEditingController(text: "");
      designationTextEditingControllers.add(textEditingController);
      // return textFields.add(new TextField(controller: textEditingController));
    }
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
