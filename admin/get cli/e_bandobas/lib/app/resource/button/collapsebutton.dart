import 'package:e_bandobas/app/resource/button/dutipointbutton.dart';
import 'package:e_bandobas/app/resource/button/dutizonebutton.dart';
import 'package:flutter/material.dart';


class CollapseButton  extends StatelessWidget{
  const CollapseButton({super.key});

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