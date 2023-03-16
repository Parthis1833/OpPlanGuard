import 'package:e_bandobas/app/Config/routes/app_pages.dart';
import 'package:e_bandobas/app/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Navigation_Drawer extends StatelessWidget {
  const Navigation_Drawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          buidDrawerHeader(),
          buildDrawerItem(
              text: 'એસેસર્સમેન્ટ',
              icon: Icons.app_registration,
              tileColor: Get.currentRoute == Routes.ASSESMENT ? Colors.blue : null,
              textIconColor: Get.currentRoute == Routes.ASSESMENT
                  ? Colors.white
                  : Colors.black87,
              onTap: () => navigate(0)),
          buildDrawerItem(
            text: 'પોઇન્ટ એસેસર્સમેન્ટ',
            icon: Icons.data_usage_rounded,
            tileColor: Get.currentRoute == Routes.PointAssesment ? Colors.blue : null,
            textIconColor: Get.currentRoute == Routes.PointAssesment
                ? Colors.white
                : Colors.black87,
            onTap: () => navigate(1),
          ),
          buildDrawerItem(
            text: 'ડ્યુટી પોઈન્ટ',
            icon: Icons.add_location_outlined,
            tileColor:
                Get.currentRoute == Routes.DUTYPOINT ? Colors.blue : null,
            textIconColor: Get.currentRoute == Routes.DUTYPOINT
                ? Colors.white
                : Colors.black87,
            onTap: () => navigate(2),
          ),
          buildDrawerItem(
            text: 'ડ્યુટી પોઇન્ટ અલ્લોકાશન',
            icon: Icons.add_card_outlined,
            tileColor: Get.currentRoute == Routes.DUTYPOINTALLOCATION
                ? Colors.blue
                : null,
            textIconColor: Get.currentRoute == Routes.DUTYPOINTALLOCATION
                ? Colors.white
                : Colors.black87,
            onTap: () => navigate(3),
          ),
          buildDrawerItem(
            text: 'અધિકારી ડેટા',
            icon: Icons.dashboard_customize,
            tileColor:
                Get.currentRoute == Routes.OFFICERDATA ? Colors.blue : null,
            textIconColor: Get.currentRoute == Routes.OFFICERDATA
                ? Colors.white
                : Colors.black87,
            onTap: () => navigate(4),
          ),
          buildDrawerItem(
            text: 'રોડ બંદોબસ્ત',
            icon: Icons.add_card_outlined,
            tileColor:
                Get.currentRoute == Routes.ROADBANDOBAST ? Colors.blue : null,
            textIconColor: Get.currentRoute == Routes.ROADBANDOBAST
                ? Colors.white
                : Colors.black87,
            onTap: () => navigate(5),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: buildDrawerItem(
                  text: 'સેટટિંગ',
                  icon: Icons.settings,
                  tileColor:
                      Get.currentRoute == Routes.SETTING ? Colors.blue : null,
                  textIconColor: Get.currentRoute == Routes.SETTING
                      ? Colors.white
                      : Colors.black,
                  onTap: () => navigate(6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buidDrawerHeader() {
    return SizedBox(
      height: 210,
      child: DrawerHeader(
          margin: const EdgeInsets.only(top: 0.5),
          decoration: const BoxDecoration(
            color: Color.fromARGB(100, 28, 54, 105),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/logo.png',
                    width: 170, height: 140, fit: BoxFit.fill),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'ઈ બંદોબસ્ત ',
                    style: TextStyle(
                      fontSize: 26.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget buildDrawerItem({
    required String text,
    required IconData icon,
    required Color textIconColor,
    required Color? tileColor,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ListTile(
        visualDensity: const VisualDensity(vertical: -2),
        hoverColor: const Color.fromARGB(79, 126, 126, 190),
        leading: Icon(icon, color: textIconColor),
        title: Text(text,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        tileColor: tileColor,
        onTap: onTap,
      ),
    );
  }

  navigate(int index) {
    if (index == 0) {
      CustomRouteManager.ASSESMENT();
    } else if (index == 1) {
      CustomRouteManager.PointAssesment();
    } else if (index == 2) {
      CustomRouteManager.DUTYPOINT();
    } else if (index == 3) {
      CustomRouteManager.DUTYPOINTALLOCATION();
    } else if (index == 4) {
      CustomRouteManager.OFFICERDATA();
    } else if (index == 5) {
      CustomRouteManager.ROADBANDOBAST();
    } else if (index == 6) {
      CustomRouteManager.SETTING();
    }
  }
}
