import 'package:e_bandobas1/Resources/Button/dutipointButton.dart';
import 'package:e_bandobas1/Resources/Button/dutizoneButton.dart';
import 'package:flutter/material.dart';


class CollepseButton  extends StatelessWidget{
  const CollepseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            DutiPointButton(),
            DutiZoneButton(),
          ]
      ),
    );
  }
  
}