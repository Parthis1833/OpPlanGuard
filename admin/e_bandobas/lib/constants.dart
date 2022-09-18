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

var CardView =  Center(
    child: GridView.extent(
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      maxCrossAxisExtent: 170.0,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(4),
          color: Colors.grey,
          child: const Text('SP', style: TextStyle(fontSize: 20)),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          color: Colors.grey,
          child: const Text('DYSP', style: TextStyle(fontSize: 20)),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          color: Colors.grey,
          child: const Text('PI', style: TextStyle(fontSize: 20)),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          color: Colors.grey,
          child: const Text('PSI', style: TextStyle(fontSize: 20)),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          color: Colors.grey,
          child: const Text('MEN POLICE', style: TextStyle(fontSize: 20)),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          color: Colors.grey,
          child: const Text('WOMAN POLICE', style: TextStyle(fontSize: 20)),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          color: Colors.grey,
          child: const Text('HG', style: TextStyle(fontSize: 20)),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          color: Colors.grey,
          child: const Text('GRD', style: TextStyle(fontSize: 20)),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          color: Colors.grey,
          child: const Text('SRP', style: TextStyle(fontSize: 20)),
        ),
      ],
    )
);