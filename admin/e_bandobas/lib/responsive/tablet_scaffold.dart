import 'package:flutter/material.dart';

import '../constants.dart';

class TabletScaffold extends StatefulWidget {
  const TabletScaffold({super.key});

  @override
  State<TabletScaffold> createState() => _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold> {
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