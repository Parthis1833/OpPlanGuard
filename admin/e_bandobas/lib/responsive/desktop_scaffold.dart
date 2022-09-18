import 'package:flutter/material.dart';
import '../constants.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar:myAppBar,
      backgroundColor: Colors.grey[300],
      body:CardView,
      drawer: Container(
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
      floatingActionButton: floatingbutton,

    );
  }
}