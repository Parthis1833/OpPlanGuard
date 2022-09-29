import 'package:flutter/material.dart';
import '../constants.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar:myAppBar,
      backgroundColor: Colors.grey[300],
      body:SizedBox(
        child: CardView,),
      drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.20,
          child: Drawer(
            child: Column(
              children: [
                SizedBox(
                  height: 190,
                  child: DrawerHeader(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Image.asset('assets/images/logo.png',
                                width: 170, height: 125, fit: BoxFit.fill),),

                          const Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                              child: Text(
                                'ઈ બંદોબસ્ત ',
                                style: TextStyle(
                                  fontSize: 23.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  hoverColor: const Color.fromARGB(79, 126, 126, 190),
                  leading: const Icon(
                    Icons.app_registration,
                  ),
                  title:const Text('એસેસર્સમેન્ટ',
                    style :  TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                      fontSize: 16.0,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  hoverColor: const Color.fromARGB(79, 126, 126, 190),
                  leading: const Icon(
                    Icons.add_location_outlined,
                  ),
                  title: const Text('ડ્યુટી પોઈન્ટ',
                    style :  TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                      fontSize: 16.0,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  hoverColor: const Color.fromARGB(79, 126, 126, 190),
                  leading: const Icon(
                    Icons.data_usage_rounded,
                  ),
                  title: const Text('કાઉન્ટર',
                    style :  TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                      fontSize: 16.0,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  hoverColor: const Color.fromARGB(79, 126, 126, 190),
                  leading: const Icon(
                    Icons.add_card_outlined,
                  ),
                  title: const Text('ડ્યુટી પોઇન્ટ અલ્લોકાશન',
                    style :  TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                      fontSize: 16.0,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  hoverColor: const Color.fromARGB(79, 126, 126, 190),
                  leading: const Icon(
                    Icons.dashboard_customize,
                  ),
                  title: const Text('અધિકારી ડેટા',
                    style :  TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                      fontSize: 16.0,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  hoverColor: const Color.fromARGB(79, 126, 126, 190),
                  leading: const Icon(
                    Icons.add_road_sharp,
                  ),
                  title: const Text('રોડ બંદોબસ્ત ',
                    style :  TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                      fontSize: 16.0,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: ListTile(
                      visualDensity: const VisualDensity(vertical: -4),
                      hoverColor: const Color.fromARGB(79, 126, 126, 190),
                      leading: const Icon(
                        Icons.settings,
                      ),
                      title: const  Text('સેટટિંગ',
                        style :  TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.black87,
                          fontSize: 16.0,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Stack(
                    clipBehavior: Clip.none, children: <Widget>[
                      Positioned(
                        left: -24.0,
                        top: -20.0,
                        child: InkResponse(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                              width:40.0,
                              height:40.0,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(
                                      50, 50, 65, 0.14901960784313725),
                              ),
                              child: const Icon(Icons.close,),
                          ),
                        ),
                      ),
                      SizedBox.fromSize(
                        size: const Size(1386, 900),
                        child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(left: 30.0),
                              child: const Align(
                                alignment: Alignment.topLeft ,
                                child: Text('એડિટ એસેસર્સમેન્ટ',
                                  style :  TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black87,
                                  fontSize: 20.0,
                                ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(),
                            ),
                            const Padding(
                                padding: EdgeInsets.all(10.0)

                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ButtonBar(
                                    alignment: MainAxisAlignment.center,
                                    buttonPadding:const EdgeInsets.symmetric(
                                      horizontal: 30,
                                      vertical: 15,
                                    ),
                                    children: [
                                      SizedBox(
                                        width: 150.0,
                                        height: 36.0,
                                        child: ElevatedButton(
                                          onPressed: () { Navigator.of(context).pop(); },
                                          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                                          child: const Text("Cancel",
                                            style: TextStyle(color: Colors.black87),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150.0,
                                        height: 36.0,
                                        child: ElevatedButton(
                                          onPressed: (){},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.black87,
                                          ),
                                          child: const Text("Save"),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                              ),

                          ],
                        ),
                      ),
                      ),
                    ],
                  ),
                );
              }
              );
        },
        child: const Icon(
          Icons.add_circle_outline,
          color: Colors.deepPurple,
          size: 56.4,
        ),
      ),

    );
  }
}