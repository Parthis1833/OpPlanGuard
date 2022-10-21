import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AssessmentPOPPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController assessmentName = TextEditingController();
  TextEditingController spValue = TextEditingController();
  TextEditingController dyspValue = TextEditingController();
  TextEditingController piValue = TextEditingController();
  TextEditingController psiValue = TextEditingController();
  TextEditingController srpValue = TextEditingController();
  TextEditingController munpoliceValue = TextEditingController();
  TextEditingController womanpoliceValue = TextEditingController();
  TextEditingController hgValue = TextEditingController();
  TextEditingController grdValue = TextEditingController();

  AssessmentPOPPage({super.key});
  get myFocusNode => null;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                            controller: assessmentName,
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
                  margin: const EdgeInsets.only(left: 50, right: 50),
                  height: 400,
                  child: Row(
                    children: [
                      Container(
                        height: 300,
                        margin: const EdgeInsets.only(bottom: 30, left: 15.0),
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Container(
                              width: 480,
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 50),
                                    child: const Text(
                                      'એસ.પી',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black54,
                                          fontSize: 22.0),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 120,
                                    child: TextField(
                                      controller: spValue,
                                      focusNode: myFocusNode,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
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
                                ],
                              ),
                            ),
                            Container(
                              width: 480,
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(),
                                    child: const Text(
                                      'ડીવાયએસપી',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black54,
                                          fontSize: 22.0),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 120,
                                    child: TextField(
                                      controller: dyspValue,
                                      focusNode: myFocusNode,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
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
                                ],
                              ),
                            ),
                            Container(
                              width: 480,
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 50),
                                    child: const Text(
                                      'પીઆઈ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black54,
                                          fontSize: 22.0),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 120,
                                    child: TextField(
                                      controller: piValue,
                                      focusNode: myFocusNode,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
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
                                ],
                              ),
                            ),
                            Container(
                              width: 480,
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(),
                                    child: const Text(
                                      'પી.એસ.આઈ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black54,
                                          fontSize: 22.0),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 120,
                                    child: TextField(
                                      controller: psiValue,
                                      focusNode: myFocusNode,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
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
                                ],
                              ),
                            ),
                            Container(
                              width: 480,
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(),
                                    child: const Text(
                                      'એસ.આર.પી',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black54,
                                          fontSize: 22.0),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 120,
                                    child: TextField(
                                      controller: srpValue,
                                      focusNode: myFocusNode,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              top: 40,
                              left: 20,
                            ),
                            child: const SizedBox(
                                height: 260,
                                width: 2,
                                child: VerticalDivider(
                                    color: Color.fromARGB(100, 83, 128, 199))),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Container(
                                width: 500,
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      'પુરૂષ પોલીસ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black54,
                                          fontSize: 22.0),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      child: SizedBox(
                                        height: 40,
                                        width: 120,
                                        child: TextField(
                                          controller: munpoliceValue,
                                          focusNode: myFocusNode,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 3,
                                                  color:
                                                  Colors.lightBlueAccent),
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
                                width: 500,
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      'મહિલા પોલીસ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black54,
                                          fontSize: 22.0),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 5),
                                      child: SizedBox(
                                        height: 40,
                                        width: 120,
                                        child: TextField(
                                          controller: womanpoliceValue,
                                          focusNode: myFocusNode,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 3,
                                                  color:
                                                  Colors.lightBlueAccent),
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
                                width: 500,
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      'એચજી',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black54,
                                          fontSize: 22.0),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 75),
                                      child: SizedBox(
                                        height: 40,
                                        width: 120,
                                        child: TextField(
                                          controller: hgValue,
                                          focusNode: myFocusNode,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 3,
                                                  color:
                                                  Colors.lightBlueAccent),
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
                                width: 500,
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      'જીઆરડી',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black54,
                                          fontSize: 22.0),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 55),
                                      child: SizedBox(
                                        height: 40,
                                        width: 120,
                                        child: TextField(
                                          controller: grdValue,
                                          focusNode: myFocusNode,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 3,
                                                  color:
                                                  Colors.lightBlueAccent),
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
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}