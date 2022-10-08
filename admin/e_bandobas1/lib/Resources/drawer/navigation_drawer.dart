import 'package:e_bandobas1/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 216,
            child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(100, 28, 54, 105),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset('assets/images/logo.png',
                          width: 170, height: 125, fit: BoxFit.fill),
                    ),
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
                )),
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -4),
            hoverColor: const Color.fromARGB(79, 126, 126, 190),
            leading: const Icon(
              Icons.app_registration,
            ),
            title: const Text(
              'એસેસર્સમેન્ટ',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.black87,
                fontSize: 16.0,
              ),
            ),
            onTap: () => navigate(0),
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -4),
            hoverColor: const Color.fromARGB(79, 126, 126, 190),
            leading: const Icon(
              Icons.data_usage_rounded,
            ),
            title: const Text(
              'કાઉન્ટર',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.black87,
                fontSize: 16.0,
              ),
            ),
            onTap: () => navigate(1),
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -4),
            hoverColor: const Color.fromARGB(79, 126, 126, 190),
            leading: const Icon(
              Icons.add_location_outlined,
            ),
            title: const Text(
              'ડ્યુટી પોઈન્ટ',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.black87,
                fontSize: 16.0,
              ),
            ),
            onTap: () => navigate(2),
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -4),
            hoverColor: const Color.fromARGB(79, 126, 126, 190),
            leading: const Icon(
              Icons.add_card_outlined,
            ),
            title: const Text(
              'ડ્યુટી પોઇન્ટ અલ્લોકાશન',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.black87,
                fontSize: 16.0,
              ),
            ),
            onTap: () => navigate(3),
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -4),
            hoverColor: const Color.fromARGB(79, 126, 126, 190),
            leading: const Icon(
              Icons.dashboard_customize,
            ),
            title: const Text(
              'અધિકારી ડેટા',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.black87,
                fontSize: 16.0,
              ),
            ),
            onTap: () => navigate(4),
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -4),
            hoverColor: const Color.fromARGB(79, 126, 126, 190),
            leading: const Icon(
              Icons.add_road_sharp,
            ),
            title: const Text(
              'રોડ બંદોબસ્ત ',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.black87,
                fontSize: 16.0,
              ),
            ),
            onTap: () => navigate(5),
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
                title: const Text(
                  'સેટટિંગ',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                    fontSize: 16.0,
                  ),
                ),
                onTap: () => navigate(6),
              ),
            ),
          ),
        ],
      ),
    );
  }

  navigate(int index) {
    if (index == 0) {
      Get.toNamed(Routes.assessment);
    } else if (index == 1) {
      Get.toNamed(Routes.counter);
    } else if (index == 2) {
      Get.toNamed(Routes.duttPoint);
    } else if (index == 3) {
      Get.toNamed(Routes.duttyPointAllocation);
    } else if (index == 4) {
      Get.toNamed(Routes.officersData);
    } else if (index == 5) {
      Get.toNamed(Routes.roadBandobast);
    } else if (index == 6) {
      Get.toNamed(Routes.settings);
    }
  }
}
