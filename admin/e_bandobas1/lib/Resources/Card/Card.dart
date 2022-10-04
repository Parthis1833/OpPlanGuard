import 'package:flutter/material.dart';

var CardView = GridView.extent(
  primary: false,
  padding: const EdgeInsets.all(10),
  crossAxisSpacing: 2,
  mainAxisSpacing: 2,
  maxCrossAxisExtent: 170.0,
  children: <Widget>[
    ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: const Card(
        margin: EdgeInsets.all(2),
        color: Colors.grey,
        child: Align(
          alignment: Alignment.center,
          child: Text('SP', style: TextStyle(fontSize: 20)),
        ),
      ),
    ),


    ClipRRect(
      child: Card(
        margin: const EdgeInsets.all(2),
        color: Colors.grey,
        child: Column(
          children:  [
            Container(
              margin:const EdgeInsets.only(top:60),
              child: const Align(
                alignment: Alignment.center,
                child: Text('DYSP', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    ),

    ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: const Card(
        margin: EdgeInsets.all(2),
        color: Colors.grey,
        child: Align(
          alignment: Alignment.center,
          child: Text('PI', style: TextStyle(fontSize: 20)),
        ),
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: const Card(
        margin: EdgeInsets.all(2),
        color: Colors.grey,
        child: Align(
          alignment: Alignment.center,
          child: Text('PSI', style: TextStyle(fontSize: 20)),
        ),
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: const Card(
        margin: EdgeInsets.all(2),
        color: Colors.grey,
        child: Align(
          alignment: Alignment.center,
          child: Text('MEN POLICE', style: TextStyle(fontSize: 20)),
        ),
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: const Card(
        margin: EdgeInsets.all(2),
        color: Colors.grey,
        child: Align(
          alignment: Alignment.center,
          child: Text('WOMAN POLICE', style: TextStyle(fontSize: 20)),
        ),
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: const Card(
        margin: EdgeInsets.all(2),
        color: Colors.grey,
        child: Align(
          alignment: Alignment.center,
          child: Text('HG', style: TextStyle(fontSize: 20)),
        ),
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: const Card(
        margin: EdgeInsets.all(2),
        color: Colors.grey,
        child: Align(
          alignment: Alignment.center,
          child: Text('GRD', style: TextStyle(fontSize: 20)),
        ),
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: const Card(
        margin: EdgeInsets.all(2),
        color: Colors.grey,
        child: Align(
          alignment: Alignment.center,
          child: Text('SRP', style: TextStyle(fontSize: 20)),
        ),
      ),
    ),
  ],
);