import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AssessmentPOPPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController assessmentName = TextEditingController();
  TextEditingController spValue = TextEditingController(); // id 7
  TextEditingController dyspValue = TextEditingController(); // 8
  TextEditingController piValue = TextEditingController(); // 9
  TextEditingController psiValue = TextEditingController(); // 10
  TextEditingController srpValue = TextEditingController(); // 11
  TextEditingController munpoliceValue = TextEditingController(); // 12
  TextEditingController womanpoliceValue = TextEditingController(); // 13
  TextEditingController hgValue = TextEditingController(); // 14
  TextEditingController grdValue = TextEditingController(); // 15


  TextEditingController startdate = TextEditingController(); 
  TextEditingController enddate = TextEditingController();
  TextEditingController manpoliceValue = TextEditingController(); // 15
  TextEditingController wpiValue = TextEditingController();

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
                  margin: const EdgeInsets.only(left: 75,right: 75),
                  height: 400,
                  width:  MediaQuery.of(context).size.width * 75.0,
                  child: Row(
                    children: [
                      Container(
                        height: 400,
                        width:  MediaQuery.of(context).size.width * 0.35,
                        margin: const EdgeInsets.only(left: 15),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 55,
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: const Text(
                                          'આરંભ તારીખ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black54,
                                              fontSize: 22.0),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 45,
                                        width: 120,
                                        child: TextField(
                                          controller: startdate,
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
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 55,
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: const Text(
                                          'એસ.પી',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black54,
                                              fontSize: 22.0),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 40),
                                        height: 45,
                                        width: 120,
                                        child: TextField(
                                          controller: spValue,
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
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 55,
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: const Text(
                                          'ડીવાયએસપી',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black54,
                                              fontSize: 22.0),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 45,
                                        width: 120,
                                        child: TextField(
                                          controller: dyspValue,
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
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 55,
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: const Text(
                                          'પીઆઈ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black54,
                                              fontSize: 22.0),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 40),
                                        height: 45,
                                        width: 120,
                                        child: TextField(
                                          controller: piValue,
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
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 55,
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: const Text(
                                          'પી.એસ.આઈ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black54,
                                              fontSize: 22.0),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 45,
                                        width: 120,
                                        child: TextField(
                                          controller: psiValue,
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
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 55,
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: const Text(
                                          'એસ.આર.પી',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black54,
                                              fontSize: 22.0),
                                        ),
                                      ),
                                      Container(
                                        height: 45,
                                        width: 120,
                                        child: TextField(
                                          controller: piValue,
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: const SizedBox(
                                height: 360,
                                width: 3,
                                child: VerticalDivider(
                                    color: Color.fromARGB(100, 83, 128, 199))),
                          ),
                        ],
                      ),
                      Container(
                        height: 400,
                        width:  MediaQuery.of(context).size.width * 0.35,
                        margin: const EdgeInsets.only(left: 15),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 55,
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: const Text(
                                          'અંતિમ તારીખ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black54,
                                              fontSize: 22.0),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 45,
                                        width: 120,
                                        child: TextField(
                                          controller: enddate,
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
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 55,
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: const Text(
                                          'પુરૂષ પોલીસ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black54,
                                              fontSize: 22.0),
                                        ),
                                      ),
                                      Container(
                                        height: 45,
                                        width: 120,
                                        margin: const EdgeInsets.only(left: 10),
                                        child: TextField(
                                          controller:manpoliceValue,
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
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 55,
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: const Text(
                                          'મહિલા પોલીસ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black54,
                                              fontSize: 22.0),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 45,
                                        width: 120,
                                        child: TextField(
                                          controller: womanpoliceValue,
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
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 55,
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: const Text(
                                          'ડબલ્યુ પી આઈ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black54,
                                              fontSize: 22.0),
                                        ),
                                      ),
                                      Container(
                                        height: 45,
                                        width: 120,
                                        child: TextField(
                                          controller: wpiValue,
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
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 55,
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: const Text(
                                          'એચજી',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black54,
                                              fontSize: 22.0),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 60),
                                        height: 45,
                                        width: 120,
                                        child: TextField(
                                          controller: hgValue,
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
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 55,
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: const Text(
                                          'જીઆરડી',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black54,
                                              fontSize: 22.0),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 40),
                                        height: 45,
                                        width: 120,
                                        child: TextField(
                                          controller: grdValue,
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
                                    ],
                                  ),
                                ),
                              ],
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