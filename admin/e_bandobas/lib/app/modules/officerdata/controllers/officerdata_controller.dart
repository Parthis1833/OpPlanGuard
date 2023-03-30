import 'package:e_bandobas/app/jsondata/Police/police_api.dart';
import 'package:get/get.dart';
import '../../../../constants/enums.dart';
import '../../../jsondata/EventData/Event.dart';
import '../../../jsondata/EventData/EventApi.dart';
import '../../../jsondata/EventPoliceCount/EventPoliceCountAPI.dart';
import '../../../jsondata/EventPoliceCount/EventPoliceCountOfAssignedTotalRequestedModel.dart';
import '../views/police_data_grid_source.dart';
import '../../../jsondata/PoliceData/police_model.dart';

class OfficerdataController extends GetxController {
  //TODO: Implement OfficerdataController
  final policeList = Rxn<List<PoliceModel>>();
  final events = Rxn<List<Event>>();
  final eventAssignmentCounts = Rxn<List<EventPoliceCountAssignedTotalRequestedModel>>();
  late final selectedEventId = 0.obs;
  final policeDataGridSource = Rxn<PoliceGridSource>();
  // late PoliceGridSource policeGridSource;
  final count = 0.obs;
  void increment() => count.value++;

  void loadEvents() async {
    events.value = await EventApi.obtainEvents(API_Decision.Only_Failure);
    if (events.value != null && events.value!.isNotEmpty) {
      selectedEventId.value = events.value!.elementAt(0).id!.toInt();
      getEventAssignments();
      getPoliceData();
    }
    print(events.value);
    update();
  }

  void getEventAssignments() async {
    eventAssignmentCounts.value =
        await EventPoliceCountAPI.obtainEventPoliceCountAssignments(API_Decision.Only_Failure, selectedEventId.value);
  }

  void changeSelectedEvent(num? value) {
    selectedEventId.value = value!.toInt();
    getEventAssignments();
    getPoliceData();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    loadEvents();
  }

  void getPoliceData() async {
    policeList.value = await PoliceApi.getPoliceInEvent(API_Decision.Only_Failure, selectedEventId.value);
    if (policeList.value != null) {
      policeDataGridSource.value = PoliceGridSource(policeList.value!);
    }
  }

  Future<PoliceGridSource?> getEventPoliceDataSource() async {
    return policeDataGridSource.value;
  }

  void updateContentListRow(PoliceModel contentList) {
    policeList.value = policeList.value!.map((obj) {
      if (obj.id == contentList.id) {
        return contentList;
      } else {
        return obj;
      }
    }).toList();
    PoliceApi.updatePolice(API_Decision.Only_Failure, contentList);
    update();
  }

  void deletePoliceById(int index) async {
    print(index);
    index -= 1;
    bool deleted = await PoliceApi()
        .deletePolice(API_Decision.Only_Failure, policeList.value![index].id);
    if (deleted) {
      policeList.value!
          .removeWhere((element) => element.id == policeList.value![index].id);

      policeDataGridSource.value = PoliceGridSource(policeList.value!);
      update();
    }
  }
}