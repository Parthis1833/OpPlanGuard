import 'package:flutter/material.dart';

import '../constants.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
     // ignore: prefer_const_constructors
     return Scaffold(
       appBar:myAppBar,
       backgroundColor: Colors.grey[300],
       body: CardView,
       floatingActionButton: floatingbutton,
    );
  }
}