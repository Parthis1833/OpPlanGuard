import 'package:dio/dio.dart';
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
      Container(child: Container(height: 500, child: MyHomePage()))
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

class MyHomePage extends StatefulWidget {
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

    return Scaffold(
      appBar: AppBar(title: Text("DropdownSearch Demo")),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: EdgeInsets.all(4),
            children: <Widget>[
              ///************************[simple examples for single and multi selection]************///
              Text("[simple examples for single and multi selection]"),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<int>(
                      items: [1, 2, 3, 4, 5, 6, 7],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                  Expanded(
                    child: DropdownSearch<int>.multiSelection(
                      clearButtonProps: ClearButtonProps(isVisible: true),
                      items: [1, 2, 3, 4, 5, 6, 7],
                    ),
                  )
                ],
              ),

              ///************************[simple examples for each mode]*************************///
              Padding(padding: EdgeInsets.all(8)),
              Text("[simple examples for each mode]"),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<int>(
                      items: [1, 2, 3, 4, 5, 6, 7],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                  Expanded(
                    child: DropdownSearch<int>.multiSelection(
                      key: _popupCustomValidationKey,
                      items: [1, 2, 3, 4, 5, 6, 7],
                      popupProps: PopupPropsMultiSelection.dialog(
                        validationWidgetBuilder: (ctx, selectedItems) {
                          return Container(
                            color: Colors.blue[200],
                            height: 56,
                            child: Align(
                              alignment: Alignment.center,
                              child: MaterialButton(
                                child: Text('OK'),
                                onPressed: () {
                                  _popupCustomValidationKey.currentState
                                      ?.popupOnValidate();
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(4)),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<int>(
                      items: [1, 2, 3, 4, 5, 6, 7],
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "BottomSheet mode",
                          hintText: "Select an Int",
                        ),
                      ),
                      popupProps: PopupProps.bottomSheet(
                          bottomSheetProps: BottomSheetProps(
                              elevation: 16,
                              backgroundColor: Color(0xFFAADCEE))),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                  Expanded(
                    child: DropdownSearch<int>(
                      items: [1, 2, 3, 4, 5, 6, 7],
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Modal mode",
                          hintText: "Select an Int",
                          filled: true,
                        ),
                      ),
                      popupProps: PopupPropsMultiSelection.modalBottomSheet(
                        disabledItemFn: (int i) => i <= 3,
                      ),
                    ),
                  )
                ],
              ),

              ///************************[Favorites examples]**********************************///
              Padding(padding: EdgeInsets.all(8)),
              Text("[Favorites examples]"),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<UserModel>(
                      asyncItems: (filter) => getData(filter),
                      compareFn: (i, s) => i.isEqual(s),
                      popupProps: PopupPropsMultiSelection.modalBottomSheet(
                        isFilterOnline: true,
                        showSelectedItems: true,
                        showSearchBox: true,
                        itemBuilder: _customPopupItemBuilderExample2,
                        favoriteItemProps: FavoriteItemProps(
                          showFavoriteItems: true,
                          favoriteItems: (us) {
                            return us
                                .where((e) => e.name.contains("Mrs"))
                                .toList();
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                  Expanded(
                    child: DropdownSearch<UserModel>.multiSelection(
                      asyncItems: (filter) => getData(filter),
                      compareFn: (i, s) => i.isEqual(s),
                      popupProps: PopupPropsMultiSelection.modalBottomSheet(
                        showSearchBox: true,
                        itemBuilder: _customPopupItemBuilderExample2,
                        favoriteItemProps: FavoriteItemProps(
                          showFavoriteItems: true,
                          favoriteItems: (us) {
                            return us
                                .where((e) => e.name.contains("Mrs"))
                                .toList();
                          },
                          favoriteItemBuilder: (context, item, isSelected) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 6),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[100]),
                              child: Row(
                                children: [
                                  Text(
                                    "${item.name}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.indigo),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 8)),
                                  isSelected
                                      ? Icon(Icons.check_box_outlined)
                                      : SizedBox.shrink(),
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

              ///************************[validation examples]********************************///
              Padding(padding: EdgeInsets.all(8)),
              Text("[validation examples]"),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<int>(
                      items: [1, 2, 3, 4, 5, 6, 7],
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: (int? i) {
                        if (i == null)
                          return 'required filed';
                        else if (i >= 5) return 'value should be < 5';
                        return null;
                      },
                      clearButtonProps: ClearButtonProps(isVisible: true),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                  Expanded(
                    child: DropdownSearch<int>.multiSelection(
                      items: [1, 2, 3, 4, 5, 6, 7],
                      validator: (List<int>? items) {
                        if (items == null || items.isEmpty)
                          return 'required filed';
                        else if (items.length > 3)
                          return 'only 1 to 3 items are allowed';
                        return null;
                      },
                    ),
                  )
                ],
              ),

              ///************************[custom popup background examples]********************************///
              Padding(padding: EdgeInsets.all(8)),
              Text("[custom popup background examples]"),
              Divider(),
              DropdownSearch<String>(
                items: List.generate(5, (index) => "$index"),
                popupProps: PopupProps.menu(
                  fit: FlexFit.loose,
                  menuProps: MenuProps(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  containerBuilder: (ctx, popupWidget) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Image.asset(
                            'assets/images/arrow-up.png',
                            color: Color(0xFF2F772A),
                            height: 12,
                          ),
                        ),
                        Flexible(
                          child: Container(
                            child: popupWidget,
                            color: Color(0xFF2F772A),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(padding: EdgeInsets.all(8)),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<String>.multiSelection(
                      key: _popupBuilderKey,
                      items: List.generate(30, (index) => "$index"),
                      popupProps: PopupPropsMultiSelection.dialog(
                        onItemAdded: (l, s) => _handleCheckBoxState(),
                        onItemRemoved: (l, s) => _handleCheckBoxState(),
                        showSearchBox: true,
                        containerBuilder: (ctx, popupWidget) {
                          return _CheckBoxWidget(
                            child: popupWidget,
                            isSelected: _popupBuilderSelection,
                            onChanged: (v) {
                              if (v == true)
                                _popupBuilderKey.currentState!
                                    .popupSelectAllItems();
                              else if (v == false)
                                _popupBuilderKey.currentState!
                                    .popupDeselectAllItems();
                              _handleCheckBoxState();
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                  Expanded(
                    child: DropdownSearch<String>.multiSelection(
                      key: _multiKey,
                      items: List.generate(30, (index) => "$index"),
                      popupProps: PopupPropsMultiSelection.dialog(
                        onItemAdded: (l, s) => _handleCheckBoxState(),
                        onItemRemoved: (l, s) => _handleCheckBoxState(),
                        showSearchBox: true,
                        containerBuilder: (ctx, popupWidget) {
                          return Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: OutlinedButton(
                                      onPressed: () {
                                        // How should I unselect all items in the list?
                                        _multiKey.currentState
                                            ?.closeDropDownSearch();
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: OutlinedButton(
                                      onPressed: () {
                                        // How should I select all items in the list?
                                        _multiKey.currentState
                                            ?.popupSelectAllItems();
                                      },
                                      child: const Text('All'),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: OutlinedButton(
                                      onPressed: () {
                                        // How should I unselect all items in the list?
                                        _multiKey.currentState
                                            ?.popupDeselectAllItems();
                                      },
                                      child: const Text('None'),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(child: popupWidget),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),

              ///************************[dropdownBuilder examples]********************************///
              Padding(padding: EdgeInsets.all(8)),
              Text("[DropDownSearch builder examples]"),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<UserModel>.multiSelection(
                      asyncItems: (String? filter) => getData(filter),
                      clearButtonProps: ClearButtonProps(isVisible: true),
                      popupProps: PopupPropsMultiSelection.modalBottomSheet(
                        showSelectedItems: true,
                        itemBuilder: _customPopupItemBuilderExample2,
                        showSearchBox: true,
                        searchFieldProps: TextFieldProps(
                          controller: _userEditTextController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                _userEditTextController.clear();
                              },
                            ),
                          ),
                        ),
                      ),
                      compareFn: (item, selectedItem) =>
                          item.id == selectedItem.id,
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: 'Users *',
                          filled: true,
                          fillColor:
                              Theme.of(context).inputDecorationTheme.fillColor,
                        ),
                      ),
                      dropdownBuilder: _customDropDownExampleMultiSelection,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                  Expanded(
                    child: DropdownSearch<UserModel>(
                      asyncItems: (String? filter) => getData(filter),
                      popupProps: PopupPropsMultiSelection.modalBottomSheet(
                        showSelectedItems: true,
                        itemBuilder: _customPopupItemBuilderExample2,
                        showSearchBox: true,
                      ),
                      compareFn: (item, sItem) => item.id == sItem.id,
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: 'User *',
                          filled: true,
                          fillColor:
                              Theme.of(context).inputDecorationTheme.fillColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              ///************************[Dynamic height depending on items number]********************************///
              Padding(padding: EdgeInsets.all(8)),
              Text("[popup dynamic height examples]"),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<int>(
                      items: List.generate(50, (i) => i),
                      popupProps: PopupProps.menu(
                        showSearchBox: true,
                        title: Text('default fit'),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                  Expanded(
                    child: DropdownSearch<int>(
                      items: List.generate(50, (i) => i),
                      popupProps: PopupProps.menu(
                        title: Text('With fit to loose and no constraints'),
                        showSearchBox: true,
                        fit: FlexFit.loose,
                        //comment this if you want that the items do not takes all available height
                        constraints: BoxConstraints.tightFor(),
                      ),
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(4)),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<int>(
                      items: List.generate(50, (i) => i),
                      popupProps: PopupProps.menu(
                        showSearchBox: true,
                        fit: FlexFit.loose,
                        title: Text('fit to a specific max height'),
                        constraints: BoxConstraints(maxHeight: 300),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                  Expanded(
                    child: DropdownSearch<int>(
                      items: List.generate(50, (i) => i),
                      popupProps: PopupProps.menu(
                        title: Text('fit to a specific width and height'),
                        showSearchBox: true,
                        fit: FlexFit.loose,
                        constraints: BoxConstraints.tightFor(
                          width: 300,
                          height: 300,
                        ),
                      ),
                    ),
                  )
                ],
              ),

              ///************************[Handle dropdown programmatically]********************************///
              Padding(padding: EdgeInsets.all(8)),
              Text("[handle dropdown programmatically]"),
              Divider(),
              DropdownSearch<int>(
                key: _openDropDownProgKey,
                items: [1, 2, 3],
              ),
              Padding(padding: EdgeInsets.all(4)),
              ElevatedButton(
                onPressed: () {
                  _openDropDownProgKey.currentState?.changeSelectedItem(100);
                },
                child: Text('set to 100'),
              ),
              Padding(padding: EdgeInsets.all(4)),
              ElevatedButton(
                onPressed: () {
                  _openDropDownProgKey.currentState?.openDropDownSearch();
                },
                child: Text('open popup'),
              ),

              ///************************[multiLevel items example]********************************///
              Padding(padding: EdgeInsets.all(8)),
              Text("[multiLevel items example]"),
              Divider(),
              DropdownSearch<MultiLevelString>(
                key: myKey,
                items: myItems,
                compareFn: (i1, i2) => i1.level1 == i2.level1,
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                  interceptCallBacks: true, //important line
                  itemBuilder: (ctx, item, isSelected) {
                    return ListTile(
                      selected: isSelected,
                      title: Text(item.level1),
                      trailing: item.subLevel.isEmpty
                          ? null
                          : (item.isExpanded
                              ? IconButton(
                                  icon: Icon(Icons.arrow_drop_down),
                                  onPressed: () {
                                    item.isExpanded = !item.isExpanded;
                                    myKey.currentState?.updatePopupState();
                                  },
                                )
                              : IconButton(
                                  icon: Icon(Icons.arrow_right),
                                  onPressed: () {
                                    item.isExpanded = !item.isExpanded;
                                    myKey.currentState?.updatePopupState();
                                  },
                                )),
                      subtitle: item.subLevel.isNotEmpty && item.isExpanded
                          ? Container(
                              height: item.subLevel.length * 50,
                              child: ListView(
                                children: item.subLevel
                                    .map(
                                      (e) => ListTile(
                                        selected: myKey.currentState
                                                ?.getSelectedItem?.level1 ==
                                            e.level1,
                                        title: Text(e.level1),
                                        onTap: () {
                                          myKey.currentState
                                              ?.popupValidate([e]);
                                        },
                                      ),
                                    )
                                    .toList(),
                              ),
                            )
                          : null,
                      onTap: () => myKey.currentState?.popupValidate([item]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customDropDownExampleMultiSelection(
      BuildContext context, List<UserModel?> selectedItems) {
    if (selectedItems.isEmpty) {
      return ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: CircleAvatar(),
        title: Text("No item selected"),
      );
    }

    return Wrap(
      children: selectedItems.map((e) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            child: ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                  // this does not work - throws 404 error
                  // backgroundImage: NetworkImage(item.avatar ?? ''),
                  ),
              title: Text(e?.name ?? ''),
              subtitle: Text(
                e?.createdAt.toString() ?? '',
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _customPopupItemBuilderExample2(
    BuildContext context,
    UserModel? item,
    bool isSelected,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item?.name ?? ''),
        subtitle: Text(item?.createdAt?.toString() ?? ''),
        leading: CircleAvatar(
            // this does not work - throws 404 error
            // backgroundImage: NetworkImage(item.avatar ?? ''),
            ),
      ),
    );
  }

  Future<List<UserModel>> getData(filter) async {
    var response = await Dio().get(
      "https://5d85ccfb1e61af001471bf60.mockapi.io/user",
      queryParameters: {"filter": filter},
    );

    final data = response.data;
    if (data != null) {
      return UserModel.fromJsonList(data);
    }

    return [];
  }
}

class _CheckBoxWidget extends StatefulWidget {
  final Widget child;
  final bool? isSelected;
  final ValueChanged<bool?>? onChanged;

  _CheckBoxWidget({required this.child, this.isSelected, this.onChanged});

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
      decoration: BoxDecoration(
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
              Text('Select: '),
              Checkbox(
                  value: isSelected,
                  tristate: true,
                  onChanged: (bool? v) {
                    if (v == null) v = false;
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
class UserModel {
  final String id;
  final DateTime? createdAt;
  final String name;
  final String? avatar;

  UserModel(
      {required this.id, this.createdAt, required this.name, this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      createdAt:
          json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
      name: json["name"],
      avatar: json["avatar"],
    );
  }

  static List<UserModel> fromJsonList(List list) {
    return list.map((item) => UserModel.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.id} ${this.name}';
  }

  ///this method will prevent the override of toString
  bool userFilterByCreationDate(String filter) {
    return this.createdAt?.toString().contains(filter) ?? false;
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(UserModel model) {
    return this.id == model.id;
  }

  @override
  String toString() => name;
}