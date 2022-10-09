import 'package:flutter/material.dart';


class  PoPAssessmentPage extends StatelessWidget{
  final _formKey = GlobalKey<FormState>();
  final textEditingController = TextEditingController();
  get myFocusNode => null;

  PoPAssessmentPage({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Stack(
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
                      'સોંપણી ફેરફાર',
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
                          width:MediaQuery.of(context).size.width * 0.55,
                          child: TextField(
                            controller: textEditingController,
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
                Container(
                  margin: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20.0),
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Container(
                              width: 480,
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left:50  ),
                                    child: const Text(
                                      'એસ.પી',
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.w600,
                                          color: Colors.black54,
                                          fontSize: 22.0),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 120,
                                    child: TextField(
                                      controller:
                                      textEditingController,
                                      focusNode: myFocusNode,
                                      decoration:
                                      const InputDecoration(
                                        border:
                                        OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 3,
                                              color: Colors
                                                  .lightBlueAccent),
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
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(),
                                    child: const Text(
                                      'ડીવાયએસપી',
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.w600,
                                          color: Colors.black54,
                                          fontSize: 22.0),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 120,
                                    child: TextField(
                                      controller:
                                      textEditingController,
                                      focusNode: myFocusNode,
                                      decoration:
                                      const InputDecoration(
                                        border:
                                        OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 3,
                                              color: Colors
                                                  .lightBlueAccent),
                                        ),
                                        hintText: '',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 160.0),
                                    padding: const EdgeInsets.only(
                                        top: 25.0),
                                    child: const Text(
                                      'પીઆઈ',
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.w600,
                                          color: Colors.black54,
                                          fontSize: 22.0),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 160.0),
                                    padding: const EdgeInsets.only(
                                        top: 25.0),
                                    child: SizedBox(
                                      height: 40,
                                      width: 120,
                                      child: TextField(
                                        controller:
                                        textEditingController,
                                        focusNode: myFocusNode,
                                        decoration:
                                        const InputDecoration(
                                          border:
                                          OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 3,
                                                color: Colors
                                                    .lightBlueAccent),
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
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 160.0),
                                    padding: const EdgeInsets.only(
                                        top: 25.0),
                                    child: const Text(
                                      'પી.એસ.આઈ',
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.w600,
                                          color: Colors.black54,
                                          fontSize: 22.0),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 105.0),
                                    padding: const EdgeInsets.only(
                                        top: 25.0),
                                    child: SizedBox(
                                      height: 40,
                                      width: 120,
                                      child: TextField(
                                        controller:
                                        textEditingController,
                                        focusNode: myFocusNode,
                                        decoration:
                                        const InputDecoration(
                                          border:
                                          OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 3,
                                                color: Colors
                                                    .lightBlueAccent),
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
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 160.0),
                                    padding: const EdgeInsets.only(
                                        top: 25.0),
                                    child: const Text(
                                      'એસ.આર.પી',
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.w600,
                                          color: Colors.black54,
                                          fontSize: 22.0),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 105.0),
                                    padding: const EdgeInsets.only(
                                        top: 25.0),
                                    child: SizedBox(
                                      height: 40,
                                      width: 120,
                                      child: TextField(
                                        controller:
                                        textEditingController,
                                        focusNode: myFocusNode,
                                        decoration:
                                        const InputDecoration(
                                          border:
                                          OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 3,
                                                color: Colors
                                                    .lightBlueAccent),
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
                      Column(
                        children: [
                          Container(
                            margin:
                            const EdgeInsets.only(left: 80.0),
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 25,
                              right: 0,
                              bottom: 0,
                            ),
                            child: const SizedBox(
                                height: 320,
                                width: 2,
                                child: VerticalDivider(
                                    color: Color.fromARGB(
                                        100, 83, 128, 199))),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 400,
                        width: 480,
                        child: Container(
                          margin: const EdgeInsets.only(left: 20.0),
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 50.0),
                                      padding:
                                      const EdgeInsets.only(
                                          top: 25.0),
                                      child: const Text(
                                        'પુરૂષ પોલીસ',
                                        style: TextStyle(
                                            fontWeight:
                                            FontWeight.w600,
                                            color: Colors.black54,
                                            fontSize: 22.0),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 105.0),
                                      padding:
                                      const EdgeInsets.only(
                                          top: 25.0),
                                      child: SizedBox(
                                        height: 40,
                                        width: 120,
                                        child: TextField(
                                          controller:
                                          textEditingController,
                                          focusNode: myFocusNode,
                                          decoration:
                                          const InputDecoration(
                                            border:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 3,
                                                  color: Colors
                                                      .lightBlueAccent),
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
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [

                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 50.0),
                                      padding:
                                      const EdgeInsets.only(
                                          top: 25.0),
                                      child: const Text(
                                        'મહિલા પોલીસ',
                                        style: TextStyle(
                                            fontWeight:
                                            FontWeight.w600,
                                            color: Colors.black54,
                                            fontSize: 22.0),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 95.0),
                                      padding:
                                      const EdgeInsets.only(
                                          top: 25.0),
                                      child: SizedBox(
                                        height: 40,
                                        width: 120,
                                        child: TextField(
                                          controller:
                                          textEditingController,
                                          focusNode: myFocusNode,
                                          decoration:
                                          const InputDecoration(
                                            border:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 3,
                                                  color: Colors
                                                      .lightBlueAccent),
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
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 50.0),
                                      padding:
                                      const EdgeInsets.only(
                                          top: 25.0),
                                      child: const Text(
                                        'એચજી',
                                        style: TextStyle(
                                            fontWeight:
                                            FontWeight.w600,
                                            color: Colors.black54,
                                            fontSize: 22.0),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 170.0),
                                      padding:
                                      const EdgeInsets.only(
                                          top: 25.0),
                                      child: SizedBox(
                                        height: 40,
                                        width: 120,
                                        child: TextField(
                                          controller:
                                          textEditingController,
                                          focusNode: myFocusNode,
                                          decoration:
                                          const InputDecoration(
                                            border:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 3,
                                                  color: Colors
                                                      .lightBlueAccent),
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
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 50.0),
                                      padding:
                                      const EdgeInsets.only(
                                          top: 25.0),
                                      child: const Text(
                                        'જીઆરડી',
                                        style: TextStyle(
                                            fontWeight:
                                            FontWeight.w600,
                                            color: Colors.black54,
                                            fontSize: 22.0),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 145.0),
                                      padding:
                                      const EdgeInsets.only(
                                          top: 25.0),
                                      child: SizedBox(
                                        height: 40,
                                        width: 120,
                                        child: TextField(
                                          controller:
                                          textEditingController,
                                          focusNode: myFocusNode,
                                          decoration:
                                          const InputDecoration(
                                            border:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 3,
                                                  color: Colors
                                                      .lightBlueAccent),
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
                        width:150,
                        height: 36,
                        child: ElevatedButton(onPressed: () {
                          Navigator.of(context).pop();
                        },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                            child:  const Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Colors.black87),
                            ),),
                      ),
                      SizedBox(
                        width: 150,
                        height: 36,
                        child: ElevatedButton( onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black87,
                          ),
                           child: const Text(
                          "Save",
                          style: TextStyle(
                              color: Colors.white),
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