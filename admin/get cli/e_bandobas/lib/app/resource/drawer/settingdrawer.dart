import 'package:e_bandobas/app/route_manager.dart';
import 'package:flutter/material.dart';

class SettingDrawer extends StatelessWidget{
  const SettingDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const SizedBox(
              height: 65,
              child: DrawerHeader(
                child: Text('Setting',style: TextStyle(fontSize: 26),),
              ),
            ),
            ListTile(
              title: const Text('Password Manager'),
              onTap:(){CustomRouteManager.SETTING();},
            ),
            ListTile(
              title: const Text('Add Police'),
              onTap:(){CustomRouteManager.POLICE_CREATE();},
            ),
            ListTile(
              title: const Text('Add Police-Station'),
              onTap: () {
                CustomRouteManager.POLICE_STATION();
              },
            ),
            ListTile(
              title: const Text(' Designation'),
              onTap: () {
                CustomRouteManager.DESIGNATION_VIEW();
              },
            ),
          ],
        ),
      ),
    );
  }

}