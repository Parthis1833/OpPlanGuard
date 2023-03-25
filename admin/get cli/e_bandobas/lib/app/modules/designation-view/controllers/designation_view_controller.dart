import 'package:e_bandobas/app/Exceptions/ValidationException.dart';
import 'package:e_bandobas/app/jsondata/DesignationData/Designation.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:get/get.dart';

import '../../../../utils/text_utils.dart';
import '../../../jsondata/DesignationData/DesignationApi.dart';

class DesignationViewController extends GetxController {
  //TODO: Implement DesignationViewController

  final designations = Rxn<List<Designation>>();
  @override
  void onInit() {
    super.onInit();
    loadDesignations();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loadDesignations() async {
    designations.value =
        await DesignationApi.obtainDesignations(API_Decision.BOTH);
  }

  deleteDesignation(num? id) async {
    bool result = await DesignationApi.deleteDesignation(
        API_Decision.BOTH, id);
    if (result) {
      designations.value!.removeWhere((d) => d.id == id);
      update();
    }
  }

  void updateDesignation(String? name, String? nameInGuj, num? id) async {
    if (!TextUtils.notBlankNotEmpty(name) ||
        !TextUtils.notBlankNotEmpty(nameInGuj)) {
      throw ValidationException(cause: "Some text fields is missing")
          .showValidationSnackBar();
    }
    if (designations.value!.where((d) => d.id == id).first.name == name &&
        designations.value!.where((d) => d.id == id).first.nameInGujarati ==
            nameInGuj) {
      throw ValidationException(cause: "Nothing to update")
          .showValidationSnackBar();
    }

    bool result = await DesignationApi.updateDesignation(
        API_Decision.BOTH, name, nameInGuj, id);
    if (result) {
      designations.value = designations.value!
          .map((d) => d.id == id
              ? Designation(
                  id: id,
                  name: name,
                  nameInGujarati: nameInGuj,
                  isDeletable: d.isDeletable)
              : d)
          .toList();

      update();
    }
  }
}
