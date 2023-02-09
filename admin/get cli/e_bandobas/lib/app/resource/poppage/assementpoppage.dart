import 'package:e_bandobas/app/Exceptions/ValidationException.dart';
import 'package:e_bandobas/app/jsondata/EventData/EventApi.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class AssessmentPOPPage extends  StatefulWidget {
  const AssessmentPOPPage({super.key});

  @override
  State<StatefulWidget> createState() => _AssessmentPoPPageState();

}
class _AssessmentPoPPageState extends State<AssessmentPOPPage>{
  final _formKey = GlobalKey<FormState>();
  final eventNameTextEdit = TextEditingController();
  final eventDetailsTextEditingController = TextEditingController();
  final startDate = DateTime.now().obs;
  final endDate = DateTime.now().obs;


  void chooseStartDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: startDate.value,
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
      //initialEntryMode: DatePickerEntryMode.input,
      // initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select event start date',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'Event Start Date',
      fieldHintText: 'Month/Date/Year',
    );
    if (pickedDate != null && pickedDate != startDate.value) {
      startDate.value = pickedDate;
    }
  }

  void chooseEndDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: endDate.value,
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
      //initialEntryMode: DatePickerEntryMode.input,
      // initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select event end date',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'Event end Date',
      fieldHintText: 'Month/Date/Year',
    );
    if (pickedDate != null && pickedDate != endDate.value) {
      endDate.value = pickedDate;
    }
  }
  get myFocusNode => null;
  void savePoint() async{
    bool result = false;
    if(eventNameTextEdit.text.isNotEmpty){
      result = await EventApi.createEvent(
          API_Decision.Only_Success,
          eventNameTextEdit.text,
          eventDetailsTextEditingController.text,
          startDate.value,
          endDate.value
      );
      Navigator.of(context).pop();
    }else{
      ValidationException().validationSnackBar;
    }
  }
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
          width: MediaQuery.of(context).size.width * 95.0,
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
                      'એડિટ સોંપણી',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                        fontSize: 38.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 160.0),
                        padding: const EdgeInsets.only(top: 25.0),
                        child: const Text(
                          'સોંપણીનું નામ',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black38,
                              fontSize: 26.0),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 55.0),
                        padding: const EdgeInsets.only(top: 25.0),
                        child: SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.55,
                          child: TextField(
                            controller: eventNameTextEdit,
                            focusNode: myFocusNode,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Colors.lightBlueAccent),
                              ),
                              hintText: '',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 160.0),
                        child: const Text(
                          'સોંપણી વિગત',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black38,
                              fontSize: 26.0),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 55.0),
                        child: SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.55,
                          child: TextField(
                            controller: eventDetailsTextEditingController ,
                            focusNode: myFocusNode,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Colors.lightBlueAccent),
                              ),
                              hintText: '',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(() => Column(
                      children: [
                        Text(
                          DateFormat("dd-MM-yyyy")
                              .format(startDate.value)
                              .toString(),
                          style: const TextStyle(fontSize: 25),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            chooseStartDate();
                          },
                          child: const Text("Choose a start date"),
                        )
                      ],
                    )),
                    Obx(() => Column(
                      children: [
                        Text(
                          DateFormat("dd-MM-yyyy")
                              .format(endDate.value)
                              .toString(),
                          style: const TextStyle(fontSize: 25),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            chooseEndDate();
                          },
                          child: const Text("Choose a End date"),
                        )
                      ],
                    ))
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16.0),
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
                          onPressed: () {
                            
                            savePoint();
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