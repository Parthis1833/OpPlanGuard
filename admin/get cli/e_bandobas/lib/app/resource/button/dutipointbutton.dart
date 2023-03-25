import 'package:e_bandobas/app/jsondata/ZoneData/Zone.dart';
import 'package:e_bandobas/app/jsondata/ZoneData/ZoneApi.dart';
import 'package:e_bandobas/app/resource/poppage/dutipointpoppage.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:flutter/material.dart';

class DutiPointButton extends StatefulWidget {
  const DutiPointButton({super.key});

  @override
  State<DutiPointButton> createState() => _DutiPointButtonState();
}

class _DutiPointButtonState extends State<DutiPointButton> {
  List<Zone> zones = <Zone>[];
  bool isZoneObtained = false;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: const Text("PointButton"),
      backgroundColor: const Color.fromARGB(100, 28, 54, 105),

      label: const Text(
        'Point',
        style: TextStyle(
          fontSize: 30,
        ),
      ),
      icon: const Icon(
        Icons.add,
        color: Colors.white,
        size: 50.4,
      ),
      onPressed: () {
        _obtainZones();
        if (isZoneObtained) {
          // print("done");
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: DutipointPOPPage([]),
                );
              });
        } else {
          
        }
      }, // Text()
    );
  }

  Future<bool> _obtainZones() async {
    List<Zone> obtainedZones = await ZoneApi.obtainZones(API_Decision.Only_Failure);
    if (obtainedZones.isNotEmpty) {
      setState(() {
        zones = obtainedZones;
        isZoneObtained = true;
      });
      return true;
    }
    return false;
  }
}
