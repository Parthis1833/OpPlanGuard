import 'package:e_bandobas/responsive/desktop_scaffold.dart';
import 'package:e_bandobas/responsive/mobile_scaffold.dart';
import 'package:e_bandobas/responsive/responsive_layout.dart';
import 'package:e_bandobas/responsive/tablet_scaffold.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyAPP());
}
class MyAPP extends StatelessWidget {
  const MyAPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
        mobileScaffold: const MobileScaffold(),
        tabletScaffold: const TabletScaffold(),
        desktopScaffold: const DesktopScaffold(),
      ), 
    );
  }
}