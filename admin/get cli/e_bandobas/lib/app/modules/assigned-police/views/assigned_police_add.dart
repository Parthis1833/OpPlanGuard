import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../Config/routes/app_pages.dart';
import '../controllers/assigned_police_add_controller.dart';

class AssignedPoliceAddView extends GetView<AssignedPoliceAddController> {
  const AssignedPoliceAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: const Text('AssignedPolice Add'),
  //         centerTitle: true,
  //       ),
  //       body: Obx(() =>
  //           (controller.events.value == null && controller.points.value == null)
  //               ? const CircularProgressIndicator()
  //               : assesmentDataWidget()));
  // }

  Widget assesmentDataWidget() {
    return Container();
  }

  // Widget eventSelectionDropDownWidget() {
  //   return Container(
  //       child: DropdownButton(
  //           value: controller.selectedEventId.value,
  //           items: controller.events.value?.map((event) {
  //             return DropdownMenuItem(
  //                 value: event.id, child: Text(event.eventName.toString()));
  //           }).toList(),
  //           onChanged: (value) {
  //             controller.changeSelectedEvent(value);
  //           }));
  // }

  // Widget pointSelectionDropDownWidget() {
  //   return Container(
  //       child: DropdownButton(
  //           value: controller.selectedPointId.value,
  //           items: controller.points.value?.map((point) {
  //             return DropdownMenuItem(
  //                 value: point.id, child: Text(point.pointName.toString()));
  //           }).toList(),
  //           onChanged: (value) {
  //             controller.changeSelectedPoint(value);
  //           }));
  // }

  // showAssignments() async {
  //   eventPointAssignmentModel.value =
  //       await EventPointAssignmentModelApi.obtainEventPointAssignments(
  //           API_Decision.BOTH, selectedEventId.value, selectedPointId.value);
  //   print(eventPointAssignmentModel.value?.assignedPoliceList!.length);
  //   if (eventPointAssignmentModel.value?.assignedPoliceList != null) {
  //     isAssignmentLoaded.value = true;
  //   } else {
  //     isAssignmentLoaded.value = false;
  //   }
  //   update();
  // }

  // Widget selectPoliceByTypingName() {
  //   var _currencies = [
  //     "Food",
  //     "Transport",
  //     "Personal",
  //     "Shopping",
  //     "Medical",
  //     "Rent",
  //     "Movie",
  //     "Salary"
  //   ];
  //   return FormField<String>(
  //     builder: (FormFieldState<String> state) {
  //       return InputDecorator(
  //         decoration: InputDecoration(
  //             labelStyle: textStyle,
  //             errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
  //             hintText: 'Please select expense',
  //             border:
  //                 OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
  //         isEmpty: _currentSelectedValue == '',
  //         child: DropdownButtonHideUnderline(
  //           child: DropdownButton<String>(
  //             value: _currentSelectedValue,
  //             isDense: true,
  //             onChanged: (String newValue) {
  //               setState(() {
  //                 _currentSelectedValue = newValue;
  //                 state.didChange(newValue);
  //               });
  //             },
  //             items: _currencies.map((String value) {
  //               return DropdownMenuItem<String>(
  //                 value: value,
  //                 child: Text(value),
  //               );
  //             }).toList(),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
