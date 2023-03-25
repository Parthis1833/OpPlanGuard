import 'package:e_bandobas/app/Exceptions/ValidationException.dart';
import 'package:e_bandobas/app/jsondata/PointData/PointApi.dart';
import 'package:e_bandobas/app/jsondata/ZoneData/Zone.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/dutypoint/controllers/dutypoint_controller.dart';

// ignore: must_be_immutable
class DutipointPOPPage extends StatefulWidget {
  // DutipointPOPPage(this.zones, {super.key});
  List<Zone> zones = [];

  DutipointPOPPage( list);

  @override
  State<DutipointPOPPage> createState() => _DutipointPOPPageState();
}

class _DutipointPOPPageState extends State<DutipointPOPPage> {
  final DutypointController dutyPointController = Get.find();

  final _formKey = GlobalKey<FormState>();
  final talukaController = TextEditingController();
  final districtController = TextEditingController();
  final pointNameController = TextEditingController();
  final accessoriesController = TextEditingController();
  final remarksController = TextEditingController();
  get myFocusNode => null;

  num? _dropDownValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (dutyPointController.zoneList.value != null &&
        dutyPointController.zoneList.value!.length > 0) {
      widget.zones = dutyPointController.zoneList.value!;
      _dropDownValue = widget.zones[0].id;
    }
  }

  // void savePoint() async {
  //   bool result = false;
  //   if (pointNameController.text.isNotEmpty) {
  //     result = await PointApi.createPoint(
  //         API_Decision.Only_Success,
  //         talukaController.text,
  //         districtController.text,
  //         pointNameController.text,
  //         accessoriesController.text,
  //         remarksController.text,
  //         _dropDownValue);
  //     // ignore: use_build_context_synchronously
  //     Navigator.of(context).pop();
  //   } else {
  //     ValidationException().validationSnackBar;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Positioned(
          left: -24.0,
          top: -20.0,
          child: InkResponse(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: 70.0,
              height: 70.0,
              decoration: const BoxDecoration(),
              child: const Icon(
                Icons.close,
                color: Color.fromARGB(100, 212, 212, 212),
                size: 50,
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 75.0,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 95.0),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'એડિટ પોઇન્ટ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                        fontSize: 38.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            child: const Text(
                              'તાલુકો',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black38,
                                  fontSize: 26.0),
                            ),
                          ),
                          Container(
                            padding:
                                const EdgeInsets.only(top: 10.0, left: 50.0),
                            child: SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.50,
                              child: TextField(
                                controller: talukaController,
                                focusNode: myFocusNode,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color: Colors.lightBlueAccent),
                                  ),
                                  hintText: '',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            child: const Text(
                              'જિલ્લો',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black38,
                                  fontSize: 26.0),
                            ),
                          ),
                          Container(
                            padding:
                                const EdgeInsets.only(top: 10.0, left: 50.0),
                            child: SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.50,
                              child: TextField(
                                controller: districtController,
                                focusNode: myFocusNode,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color: Colors.lightBlueAccent),
                                  ),
                                  hintText: '',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'પોઈન્ટનું નામ',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black38,
                                fontSize: 26.0),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.50,
                              child: TextField(
                                controller: pointNameController,
                                focusNode: myFocusNode,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color: Colors.lightBlueAccent),
                                  ),
                                  hintText: '',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            child: const Text(
                              'એક્સેસરીઝ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black38,
                                  fontSize: 26.0),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.50,
                              child: TextField(
                                controller: accessoriesController,
                                focusNode: myFocusNode,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color: Colors.lightBlueAccent),
                                  ),
                                  hintText: '',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            child: const Text(
                              'રિમાર્કસ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black38,
                                  fontSize: 26.0),
                            ),
                          ),
                          Container(
                            padding:
                                const EdgeInsets.only(top: 10.0, left: 30.0),
                            child: SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.50,
                              child: TextField(
                                controller: remarksController,
                                focusNode: myFocusNode,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color: Colors.lightBlueAccent),
                                  ),
                                  hintText: '',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            child: const Text(
                              'ઝોન',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black38,
                                  fontSize: 26.0),
                            ),
                          ),
                          Container(
                            padding:
                                const EdgeInsets.only(top: 10.0, left: 65.0),
                            child: SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.50,
                              child: DropdownButton(
                                  value: _dropDownValue,
                                  items: widget.zones.map((zone) {
                                    return DropdownMenuItem(
                                        value: zone.id,
                                        child: Text(zone.name.toString()));
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _dropDownValue = value;
                                    });
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25.0),
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
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
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
                          onPressed: () async {
                            bool result = await dutyPointController.savePoint(
                                talukaController.text,
                                districtController.text,
                                pointNameController.text,
                                accessoriesController.text,
                                remarksController.text);
                            if (result) {
                              Navigator.of(context).pop();
                            }
                          },
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
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
