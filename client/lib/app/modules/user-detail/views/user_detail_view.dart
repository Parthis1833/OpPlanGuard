import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gujarat_police_client_side/app/routes/app_pages.dart';

import '../controllers/user_detail_controller.dart';

class UserDetailView extends GetView<UserDetailController> {
  UserDetailView({Key? key}) : super(key: key);
  final userNameTextFieldController = TextEditingController();
  final phoneNumberTextFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('UserDetailView'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            
            children: [
              Text("User Name"),
              TextField(
                controller: userNameTextFieldController,
              ),
              Text("Phone Number"),
              TextField(
                controller: phoneNumberTextFieldController,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.red,
                  padding: EdgeInsets.all(16),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  bool isValid = controller.createUserNameInStorage(
                      userNameTextFieldController.text,
                      phoneNumberTextFieldController.text);
        
                  if (isValid) {
                    Get.toNamed(Routes.POLICE_INSERT, arguments: {'username': userNameTextFieldController.text, 'phone-number': phoneNumberTextFieldController.text});
                  }
                },
                child: const Text(
                  "Welcome, Press to insert police",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
