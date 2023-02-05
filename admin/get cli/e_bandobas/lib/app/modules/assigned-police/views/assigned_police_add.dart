import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../Config/routes/app_pages.dart';
import '../controllers/assigned_police_add_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';

class AssignedPoliceAddView extends GetView<AssignedPoliceAddController> {
  AssignedPoliceAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AssignedPolice Add '),
        centerTitle: true,
      ),
      // body: selectPoliceByTypingName()
      body: Obx(() =>
          (controller.events.value == null && controller.points.value == null)
              ? const CircularProgressIndicator()
              : assesmentDataWidget()),
    );
  }

  Widget assesmentDataWidget() {
    return ListView(shrinkWrap: true, children: [
      Row(
        children: [
          eventSelectionDropDownWidget(),
          pointSelectionDropDownWidget(),
        ],
      ),
      Container(child: Container(height: 500, child: TestPage2()))
    ]);
  }

  Widget eventSelectionDropDownWidget() {
    return Container(
        child: DropdownButton(
            value: controller.selectedEventId.value,
            items: controller.events.value?.map((event) {
              return DropdownMenuItem(
                  value: event.id, child: Text(event.eventName.toString()));
            }).toList(),
            onChanged: (value) {
              controller.changeSelectedEvent(value);
            }));
  }

  Widget pointSelectionDropDownWidget() {
    return Container(
        child: DropdownButton(
            value: controller.selectedPointId.value,
            items: controller.points.value?.map((point) {
              return DropdownMenuItem(
                  value: point.id, child: Text(point.pointName.toString()));
            }).toList(),
            onChanged: (value) {
              controller.changeSelectedPoint(value);
            }));
  }

  Widget dropDownSearch() {
    return DropdownSearch<String>(
      popupProps: PopupProps.menu(
        showSelectedItems: true,
        disabledItemFn: (String s) => s.startsWith('I'),
      ),
      items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: "Menu mode",
          hintText: "country in menu mode",
        ),
      ),
      onChanged: print,
      selectedItem: "Brazil",
    );
  }
}

/**
 * TestPage2 is dropdown with search example but failed with 1800 records, so rejecting it.
 */

class TestPage2 extends StatefulWidget {
  const TestPage2({Key? key}) : super(key: key);

  @override
  State<TestPage2> createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  late SingleValueDropDownController _cnt;
  late MultiValueDropDownController _cntMulti;
  final formKey = GlobalKey<FormState>();

  final addPoliceController = Get.put(AssignedPoliceAddController());

  @override
  void initState() {
    _cnt = SingleValueDropDownController();
    _cntMulti = MultiValueDropDownController();
    super.initState();
  }

  @override
  void dispose() {
    _cnt.dispose();
    _cntMulti.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => addPoliceController.policeNames.value == null
        ? const CircularProgressIndicator.adaptive()
        : Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Single selection dropdown with search option",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: formKey,
                    child: DropDownTextField(
                      enableSearch: true,
                      // initialValue: "name4",
                      // readOnly: false,
                      controller: _cnt,
                      clearOption: true,

                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.always,
                      clearIconProperty: IconProperty(color: Colors.green),
                      searchDecoration: const InputDecoration(
                          hintText: "enter your custom hint text here"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Required field";
                        } else {
                          return null;
                        }
                      },
                      // dropDownItemCount:
                      //     addPoliceController.policeNames.value!.length,
                      dropDownItemCount: 6,

                      dropDownList: const [
                        DropDownValueModel(name: 'name1', value: "value1"),
                        DropDownValueModel(
                            name: 'name2',
                            value: "value2",
                            toolTipMsg:
                                "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                        DropDownValueModel(name: 'name3', value: "value3"),
                        DropDownValueModel(
                            name: 'name4',
                            value: "value4",
                            toolTipMsg:
                                "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                        DropDownValueModel(name: 'name5', value: "value5"),
                        DropDownValueModel(name: 'name6', value: "value6"),
                        DropDownValueModel(name: 'name7', value: "value7"),
                        DropDownValueModel(name: 'name8', value: "value8"),
                      ],

                      // dropDownList: dropDownValueModelListWidget(),
                      onChanged: (val) {},
                    ),
                  ),
                ],
              ),
            ),
          ));
  }

  // List<DropDownValueModel> dropDownValueModelListWidget() {
  //   List<DropDownValueModel> fields = [];
  //   addPoliceController.policeNames.value!.forEach((element) {
  //     DropDownValueModel model =
  //         DropDownValueModel(name: element.name ?? "", value: element.id);
  //     fields.add(model);
  //   });
  //   print(fields.length);
  //   return fields;
  // }
}
