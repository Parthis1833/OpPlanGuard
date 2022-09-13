import 'package:flutter/material.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[900],
      ),
      backgroundColor: Colors.grey[300],
      drawer: Drawer(
        backgroundColor: Colors.grey[300],
        child: Column(
          children: <Widget>[
            Material(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                  height: 200,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}