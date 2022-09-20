import 'package:flutter/material.dart';

var myAppBar = AppBar(
backgroundColor: Colors.blueAccent[900],
);
var floatingbutton =FloatingActionButton(
onPressed: () {

},
backgroundColor: const Color.fromARGB(128, 73, 89, 110),
child: const Icon(
Icons.add_circle_outline,
color: Colors.deepPurple,
size: 56.4,

),
);

// ignore: non_constant_identifier_names
var CardView = GridView.extent(
    primary: false,
    padding: const EdgeInsets.all(10),
    crossAxisSpacing:2,
    mainAxisSpacing: 2,
    maxCrossAxisExtent: 170.0,
    children: <Widget>[
      ClipRRect (
        borderRadius: BorderRadius.circular(5.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        color: Colors.grey,
        child: const Align(
          alignment: Alignment.center,
          child: Text('SP', style: TextStyle(fontSize: 20)),
        ),
      ),
    ),
      ClipRRect (
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          padding: const EdgeInsets.all(12),
          color: Colors.grey,
          child: const Align(
            alignment: Alignment.center,
            child: Text('DYSP', style: TextStyle(fontSize: 20)),
          ),
        ),
      ),
      ClipRRect (
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          padding: const EdgeInsets.all(12),
          color: Colors.grey,
          child: const Align(
            alignment: Alignment.center,
            child: Text('PI', style: TextStyle(fontSize: 20)),
          ),
        ),
      ),
      ClipRRect (
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          padding: const EdgeInsets.all(12),
          color: Colors.grey,
          child: const Align(
            alignment: Alignment.center,
            child: Text('PSI', style: TextStyle(fontSize: 20)),
          ),
        ),
      ),
      ClipRRect (
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          padding: const EdgeInsets.all(12),
          color: Colors.grey,
          child: const Align(
            alignment: Alignment.center,
            child: Text('MEN POLICE', style: TextStyle(fontSize: 20)),
          ),
        ),
      ),
      ClipRRect (
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          padding: const EdgeInsets.all(12),
          color: Colors.grey,
          child: const Align(
            alignment: Alignment.center,
            child: Text('WOMAN POLICE', style: TextStyle(fontSize: 20)),
          ),
        ),
      ),
      ClipRRect (
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          padding: const EdgeInsets.all(12),
          color: Colors.grey,
          child: const Align(
            alignment: Alignment.center,
            child: Text('HG', style: TextStyle(fontSize: 20)),
          ),
        ),
      ),
      ClipRRect (
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          padding: const EdgeInsets.all(12),
          color: Colors.grey,
          child: const Align(
            alignment: Alignment.center,
            child: Text('GRD', style: TextStyle(fontSize: 20)),
          ),
        ),
      ),
      ClipRRect (
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          padding: const EdgeInsets.all(12),
          color: Colors.grey,
          child: const Align(
            alignment: Alignment.center,
            child: Text('SRP', style: TextStyle(fontSize: 20)),
          ),
        ),
      ),
    ],
  );