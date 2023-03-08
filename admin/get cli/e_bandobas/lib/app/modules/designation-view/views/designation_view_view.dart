import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/designation_view_controller.dart';

class DesignationViewView extends GetView<DesignationViewController> {
  const DesignationViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DesignationViewView'),
          centerTitle: true,
        ),
        body: Obx(() => controller.designations.value == null ?
        const CircularProgressIndicator.adaptive() 
        : Center(
            child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(),
                ),
                Expanded(
                  flex: 3,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text("J"),
                    ),
                    title: Text(
                      'English',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    subtitle: Text(
                      'Gujarati',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    trailing: Icon(
                      Icons.edit_note_sharp,
                      size: 20.0,
                    ),
                    onTap: () {
                      // Do something when the tile is tapped
                    },
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(),
                ),
              ],
            ),
            ...generateDesignations(),
          ],
        ))));
  }

  List<Widget> generateDesignations() {
    List<Widget> designations = <Widget>[];
    designations = List.generate(
        controller.designations.value!.length,
        (index) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(),
                ),
                Expanded(
                  flex: 3,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(controller.designations.value![index].name![0])
                    ),
                    title: Text(
                      controller.designations.value![index].name ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    subtitle: Text(
                      controller.designations.value![index].nameInGujarati ?? "",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    trailing: Icon(
                      Icons.edit_note_sharp,
                      size: 20.0,
                    ),
                    onTap: () {
                      // Do something when the tile is tapped
                    },
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(),
                ),
              ],
            ));

    return designations;
  }
}
