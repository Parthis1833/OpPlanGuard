import 'package:e_bandobas1/Resources/POPPage/popassessmentpage.dart';
import 'package:flutter/material.dart';

class AssesmentButton extends StatelessWidget {
  AssesmentButton({super.key});
  final _formKey = GlobalKey<FormState>();
  final textEditingController = TextEditingController();

  get myFocusNode => null;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color.fromARGB(100, 28, 54, 105),
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content:  PoPAssessmentPage(),
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
