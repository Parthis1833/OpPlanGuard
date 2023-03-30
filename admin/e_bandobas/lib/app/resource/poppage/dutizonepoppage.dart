import 'package:e_bandobas/app/Exceptions/ValidationException.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DutyzonePOPPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final zoneName = TextEditingController();

  DutyzonePOPPage({super.key});
  get myFocusNode => null;
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
          width: MediaQuery.of(context).size.width * 85.0,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 75.0),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'એડિટ ઝોન ',
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
                  height: 200.0,
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 60.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'ઝોનનું નામ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black38,
                                  fontSize: 26.0),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.50,
                                child: TextField(
                                  controller: zoneName,
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
                      ),
                    ],
                  ),
                ),
                Container(
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
                            _createZone();
                            if(zoneName.text.isNotEmpty){
                              Navigator.of(context).pop();
                            }else{
                              ValidationException().showValidationSnackBar();
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

  void _createZone() async {
    final response = await http.post(
      Uri.parse('http://localhost:8080/zone/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': zoneName.text.trim(),
      }),
    );
    // print(response.body);
    final responseJson = jsonDecode(response.body);

    // successful response
    if (responseJson['response']['error'] == 0) {
      // print(responseJson['content']);
      Get.snackbar(
        "Success",
        "Zone created successfully with name '" + responseJson['content']['name'],
        icon: const Icon(Icons.add_task_sharp, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );
    } else {
      // print(responseJson['response']['message']);
      Get.snackbar(
        "Failed",
        responseJson['response']['message'],
        icon: const Icon(Icons.cancel_presentation_sharp, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    }
  }
}