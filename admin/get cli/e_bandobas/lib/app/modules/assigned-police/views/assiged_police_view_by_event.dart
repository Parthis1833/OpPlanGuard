import 'package:e_bandobas/app/modules/assigned-police/controllers/assiged_police_view_by_event_controller.dart';
import 'package:e_bandobas/app/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AssignedPoliceByEventView
    extends GetView<AssignedPoliceByEventController> {
  const AssignedPoliceByEventView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assigned Police In Event'), //TODO: new name
        centerTitle: true,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(3.0),
        child: SizedBox(
          width: 80,
          height: 50,
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.green;
                  }
                  return Colors.blue;
                }),
                textStyle: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return const TextStyle(fontSize: 25);
                  }
                  return const TextStyle(fontSize: 15);
                }),
              ),
              onPressed: () {
                CustomRouteManager.ASSIGNED_POLICE_ADD();
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.add_circle_outline,
                    color: Colors.deepPurple,
                    size: 25,
                  ),
                  Text("Add"),
                ],
              )),
        ),
      ),
    );
  }
}
