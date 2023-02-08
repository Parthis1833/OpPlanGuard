import 'package:e_bandobas/app/jsondata/PoliceData/PoliceIdNameDesigNumbModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/assigned_police_add_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';

class AssignedPoliceAddView extends GetView<AssignedPoliceAddController> {
  const AssignedPoliceAddView({Key? key}) : super(key: key);

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
      const SizedBox(height: 100, child: MyHomePage()),
      datePickersOfEvent(),
      saveAndAssignPoliceWidget()
    ]);
  }

  Widget datePickersOfEvent() {
    return Row(
      children: [
        Obx(() => Column(
              children: [
                Text(
                  DateFormat("dd-MM-yyyy")
                      .format(controller.startDate.value)
                      .toString(),
                  style: const TextStyle(fontSize: 25),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.chooseStartDate();
                  },
                  child: const Text("Choose a start date"),
                )
              ],
            )),
        Obx(() => Column(
              children: [
                Text(
                  DateFormat("dd-MM-yyyy")
                      .format(controller.endDate.value)
                      .toString(),
                  style: const TextStyle(fontSize: 25),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.chooseEndDate();
                  },
                  child: const Text("Choose a End date"),
                )
              ],
            ))
      ],
    );
  }

  Widget saveAndAssignPoliceWidget() {
    // show yellow if no police is selected or show red if something went wrong or green if success
    return ElevatedButton(
      child: Text('Assign Police'),
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        textStyle: const TextStyle(
            color: Colors.white, fontSize: 10, fontStyle: FontStyle.normal),
      ),
      onPressed: controller.assignPolice,
    );
  }

  Widget eventSelectionDropDownWidget() {
    return DropdownButton(
        value: controller.selectedEventId.value,
        items: controller.events.value?.map((event) {
          return DropdownMenuItem(
              value: event.id, child: Text(event.eventName.toString()));
        }).toList(),
        onChanged: (value) {
          controller.changeSelectedEvent(value);
        });
  }

  Widget pointSelectionDropDownWidget() {
    return DropdownButton(
        value: controller.selectedPointId.value,
        items: controller.points.value?.map((point) {
          return DropdownMenuItem(
              value: point.id, child: Text(point.pointName.toString()));
        }).toList(),
        onChanged: (value) {
          controller.changeSelectedPoint(value);
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _openDropDownProgKey = GlobalKey<DropdownSearchState<int>>();
  final _multiKey = GlobalKey<DropdownSearchState<String>>();
  final _popupBuilderKey = GlobalKey<DropdownSearchState<String>>();
  final _popupCustomValidationKey = GlobalKey<DropdownSearchState<int>>();
  final _userEditTextController = TextEditingController(text: 'Mrs');
  final myKey = GlobalKey<DropdownSearchState<MultiLevelString>>();
  final controller = Get.put(AssignedPoliceAddController());

  final List<MultiLevelString> myItems = [
    MultiLevelString(level1: "1"),
    MultiLevelString(level1: "2"),
    MultiLevelString(
      level1: "3",
      subLevel: [
        MultiLevelString(level1: "sub3-1"),
        MultiLevelString(level1: "sub3-2"),
      ],
    ),
    MultiLevelString(level1: "4")
  ];
  bool? _popupBuilderSelection = false;

  @override
  Widget build(BuildContext context) {
    void _handleCheckBoxState({bool updateState = true}) {
      var selectedItem =
          _popupBuilderKey.currentState?.popupGetSelectedItems ?? [];
      var isAllSelected =
          _popupBuilderKey.currentState?.popupIsAllItemSelected ?? false;
      _popupBuilderSelection =
          selectedItem.isEmpty ? false : (isAllSelected ? true : null);

      if (updateState) setState(() {});
    }

    _handleCheckBoxState(updateState: false);

    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: ListView(
        padding: const EdgeInsets.all(4),
        children: <Widget>[
          ///************************[Favorites examples]**********************************///
          const Padding(padding: EdgeInsets.all(8)),
          const Text("select police and assign"),
          const Divider(),
          Row(
            children: [
              const Padding(padding: EdgeInsets.all(4)),
              Expanded(
                child: DropdownSearch<PoliceIdNameDesigNumb>.multiSelection(
                  clearButtonProps: ClearButtonProps(
                    icon: Icon(Icons.cancel),
                    isVisible: true,
                    onPressed: () {},
                  ),
                  onChanged: controller.onChangeSelected,
                  asyncItems: (filter) {
                    return controller.getData(filter);
                  },
                  compareFn: (i, s) => i.isEqual(s),
                  popupProps: PopupPropsMultiSelection.modalBottomSheet(
                    title: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Select Police to assign in event and point"),
                    ),
                    showSearchBox: true,
                    itemBuilder: _customPopupItemBuilderForPolice,
                    favoriteItemProps: FavoriteItemProps(
                      showFavoriteItems: true,
                      // favoriteItems: (us) {
                      //   return us
                      //       .where((e) => e.name.contains("Mrs"))
                      //       .toList();
                      // },
                      favoriteItemBuilder: (context, item, isSelected) {
                        // print(item);
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 6),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[100]),
                          child: Row(
                            children: [
                              Text(
                                "${item.name}", // Todo policeName here
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.indigo),
                              ),
                              const Padding(padding: EdgeInsets.only(left: 8)),
                              isSelected
                                  ? const Icon(Icons.check_box_outlined)
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _customPopupItemBuilderForPolice(
      BuildContext context, PoliceIdNameDesigNumb? item, bool isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Row(
          children: [
            Text(item?.name ?? ''),
            Text(item?.designation ?? '',
                style:
                    const TextStyle(color: Colors.amberAccent, fontSize: 16)),
          ],
        ),
        subtitle: Row(
          children: [
            Text(item?.district ?? ''),
            Text(item?.number ?? ''),
          ],
        ),
        leading: const CircleAvatar(
            // this does not work - throws 404 error
            // backgroundImage: NetworkImage(item.avatar ?? ''),
            ),
      ),
    );
  }

  Future<List<PoliceIdNameDesigNumb>> getDataV2(filter) async {
    // var response = await Dio().get(
    //   "https://5d85ccfb1e61af001471bf60.mockapi.io/user",
    //   queryParameters: {"filter": filter},
    // );

    // final data = response.data;

    if (controller.policeNames.value != null) {
      return controller.policeNames.value!;
    }
    return [];
  }
}

class _CheckBoxWidget extends StatefulWidget {
  final Widget child;
  final bool? isSelected;
  final ValueChanged<bool?>? onChanged;

  const _CheckBoxWidget({required this.child, this.isSelected, this.onChanged});

  @override
  CheckBoxState createState() => CheckBoxState();
}

class CheckBoxState extends State<_CheckBoxWidget> {
  bool? isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  void didUpdateWidget(covariant _CheckBoxWidget oldWidget) {
    if (widget.isSelected != isSelected) isSelected = widget.isSelected;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0x88F44336),
            Colors.blue,
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('Select: '),
              Checkbox(
                  value: isSelected,
                  tristate: true,
                  onChanged: (bool? v) {
                    v ??= false;
                    setState(() {
                      isSelected = v;
                      if (widget.onChanged != null) widget.onChanged!(v);
                    });
                  }),
            ],
          ),
          Expanded(child: widget.child),
        ],
      ),
    );
  }
}

class MultiLevelString {
  final String level1;
  final List<MultiLevelString> subLevel;
  bool isExpanded;

  MultiLevelString({
    this.level1 = "",
    this.subLevel = const [],
    this.isExpanded = false,
  });

  MultiLevelString copy({
    String? level1,
    List<MultiLevelString>? subLevel,
    bool? isExpanded,
  }) =>
      MultiLevelString(
        level1: level1 ?? this.level1,
        subLevel: subLevel ?? this.subLevel,
        isExpanded: isExpanded ?? this.isExpanded,
      );

  @override
  String toString() => level1;
}
