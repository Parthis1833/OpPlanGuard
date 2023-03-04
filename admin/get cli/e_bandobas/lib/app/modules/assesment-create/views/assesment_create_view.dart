import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/assesment_create_controller.dart';

class AssesmentCreateView extends GetView<AssesmentCreateController> {
  const AssesmentCreateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assesment Create In Event View'),
        centerTitle: true,
      ),
      body: popUpPageDataWidget(),
    );
  }
  Widget popUpPageDataWidget() {
    return Obx(() => (controller.events.value == null ||
            controller.designations.value == null)
        ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(child: CircularProgressIndicator.adaptive()),
          ],
        )
        : ListView(
            children: [
              eventSelectionDropDownWidget(),
              saveCancelContainerRow(),
              designationListWidget(),
            ],
          ));
  }

  Widget designationListWidget() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10, left: 20),
      child: ListView.builder(
        padding: const EdgeInsets.all(25),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: (controller.designations.value!.length / 2).ceil(),
        itemBuilder: (context, index) {
          return Center(
            child: Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: [
                  Container(
                    width: 200,
                    height: 70,
                    margin: const EdgeInsets.only(left: 40.0),
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      controller.designations.value![index * 2].name.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black38,
                          fontSize: 26.0),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 45,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ], // Only numbers can be entered
                      controller: controller
                          .designationTextEditingControllers[index * 2],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Colors.lightBlueAccent),
                        ),
                        hintText: '',
                      ),
                    ),
                  ),
                  (index * 2 + 1 < controller.designations.value!.length)
                      ? Container(
                          width: 200,
                          height: 70,
                          margin: const EdgeInsets.only(left: 40.0),
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            controller.designations.value![index * 2 + 1].name
                                .toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black38,
                                fontSize: 26.0),
                          ),
                        )
                      : Container(),
                  (index * 2 + 1 < controller.designations.value!.length)
                      ? SizedBox(
                          width: 150,
                          height: 45,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ], // Only numbers can be entered
                            controller:
                                controller.designationTextEditingControllers[
                                    index * 2 + 1],
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Colors.lightBlueAccent),
                              ),
                              hintText: '',
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget saveCancelContainerRow() {
    return Container(
      alignment: FractionalOffset.center,
      width: 580,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              width: 150,
              height: 36,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ),
            SizedBox(
              width: 140,
              height: 36,
              child: ElevatedButton(
                onPressed: () {
                  controller.saveEventAssignment();
                },
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
    );
  }

  Widget eventSelectionDropDownWidget() {
    return Container(
      height: 75,
      width: 600,
      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 160.0),
            padding: const EdgeInsets.only(bottom: 2.0),
            height: 55,
            width: 250,
            child: const Text(
              'સોંપણીનું નામ  :-',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black38,
                  fontSize: 38.0),
            ),
          ),
          SizedBox(
            height: 55,
            width: 300,
            child: DropdownButton(
                hint: const Text("select event"),
                value: controller.selectedEventId.value == 0
                    ? null
                    : controller.selectedEventId.value,
                items: controller.events.value?.map((event) {
                  return DropdownMenuItem(
                      value: event.id,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          event.eventName.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black38,
                              fontSize: 28.0),
                        ),
                      ));
                }).toList(),
                onChanged: (value) {
                  controller.changeSelectedEvent(value);
                }),
          ),
        ],
      ),
    );
  }
}