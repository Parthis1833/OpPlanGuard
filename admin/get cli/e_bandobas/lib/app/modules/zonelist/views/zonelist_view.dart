import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/zonelist_controller.dart';

class ZonelistView extends GetView<ZonelistController> {
  const ZonelistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZonelistView'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
        ],
      ),
    );
  }
}
