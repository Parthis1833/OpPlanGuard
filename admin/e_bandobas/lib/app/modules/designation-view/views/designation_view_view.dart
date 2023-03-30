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
        body: Obx(() => controller.designations.value == null
            ? const CircularProgressIndicator.adaptive()
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
                    focusColor: Colors.white,
                    splashColor: Colors.white,
                    hoverColor: Colors.white,
                    leading: CircleAvatar(
                        child: Text(
                            controller.designations.value![index].name![0])),
                    title: Text(
                      controller.designations.value![index].name ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    subtitle: Text(
                      controller.designations.value![index].nameInGujarati ??
                          "",
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        controller.designations.value![index].isDeletable!
                            ? Padding(
                                padding: EdgeInsets.all(8.0),
                                child: IconButton(
                                  onPressed: () => controller.deleteDesignation(
                                      controller.designations.value![index].id),
                                  icon: Icon(Icons.delete_forever),
                                ),
                              )
                            : Container(),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: () => updateDesignationPopUp(index),
                            icon: Icon(Icons.edit_note_sharp),
                          ),
                        ),
                      ],
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

  void updateDesignationPopUp(index) {
    final designationTextController =
        TextEditingController(text: controller.designations.value![index].name);
    final designationInGujTextController = TextEditingController(
        text: controller.designations.value![index].nameInGujarati);

    Get.defaultDialog(
      title: "Update Designation",
      content: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text("name in english"),
          TextField(
            controller: designationTextController,
          ),
          Text("designation name in gujarati"),
          TextField(
            controller: designationInGujTextController,
          )
        ]),
      ),
      actions: [
        ElevatedButton(
          onPressed: Get.back,
          child: Text('Cancel'),
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 16.0,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => controller.updateDesignation(
              designationTextController.text,
              designationInGujTextController.text,
              controller.designations.value![index].id),
          child: Text('Update'),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 16.0,
            ),
          ),
        )
      ],
    );
  }
}
