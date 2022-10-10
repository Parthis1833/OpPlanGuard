import 'package:e_bandobas1/Resources/POPPage/popzonepointpage.dart';
import 'package:flutter/material.dart';

class DutiZoneButton extends StatelessWidget {
  const DutiZoneButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: const Color.fromARGB(100, 28, 54, 105),

      label: const Text('Zone',style: TextStyle(
        fontSize: 30,
      ),
      ),
      icon: const Icon(Icons.add,
        color: Colors.white,
        size: 50.4,
      ),

      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return  AlertDialog(
                content:  PoPZonepointPage(),
              );
            });
      },// Text()
    );
  }
}
