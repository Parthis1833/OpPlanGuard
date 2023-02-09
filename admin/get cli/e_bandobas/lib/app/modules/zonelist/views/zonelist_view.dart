import 'package:e_bandobas/app/modules/assigned-police/views/assisgned_police_viewgrid.dart';
import 'package:e_bandobas/app/resource/card/PoliceCard.dart';
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
          PoliceCard(
            margin: const EdgeInsets.all(8),
            color: Colors.grey,
            child: const Align(
              child: Text(''),
            ),
          ),
        ],
      ),
    );
  }
}
