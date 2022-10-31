import 'package:e_bandobas/app/resource/poppage/roadbandobashpopage.dart';
import 'package:flutter/material.dart';

class RoadbandobasButton  extends StatelessWidget{
  const RoadbandobasButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      heroTag: const Text("RoundBandobashButton"),
      backgroundColor: const Color.fromARGB(100, 28, 54, 105),
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return  AlertDialog(
                content: RoadbandobashPOPPage(),
              );
            });
      },
      child: const Icon(
        Icons.add_circle_outline,
        color: Colors.deepPurple,
        size: 56.4,
      ),
    );
  }
}