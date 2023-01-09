import 'package:e_bandobas/app/resource/poppage/dutipointpoppage.dart';
import 'package:flutter/material.dart';

class DutiPointButton extends StatelessWidget {
  const DutiPointButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: const Text("PointButton"),
      backgroundColor: const Color.fromARGB(100, 28, 54, 105),

      label: const Text('Point',style: TextStyle(
        fontSize: 30,
      ),
      ),
      icon: const Icon(Icons.add,
        color: Colors.white,
        size: 50.4,
      ),
      onPressed: (){
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return   AlertDialog(
                content:DutipointPOPPage(),
              );
            });
      },// Text()
    );
  }
}
