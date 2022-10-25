import 'package:flutter/material.dart';

class DutipointPOPPage extends StatelessWidget{
  final _formKey = GlobalKey<FormState>();
  final pointName = TextEditingController();
  final accessories = TextEditingController();
  final remarks =  TextEditingController();
  get myFocusNode => null;
  DutipointPOPPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                            child: const Text(
                              'પોઈન્ટનું નામ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black38,
                                  fontSize: 26.0),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.50,
                              child: TextField(
                                controller: pointName,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: const EdgeInsets.only( top: 10.0) ,
                            child: const Text(
                              'એક્સેસરીઝ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black38,
                                  fontSize: 26.0),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 20.0 ,left: 25.0),
                            child: SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.50,
                              child: TextField(
                                controller: accessories,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: const EdgeInsets.only( top: 10.0) ,
                            child: const Text(
                              'રિમાર્કસ ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black38,
                                  fontSize: 26.0),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 20.0 ,left: 55.0),
                            child: SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.50,
                              child: TextField(
                                controller: accessories,
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
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(top : 25.0),
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