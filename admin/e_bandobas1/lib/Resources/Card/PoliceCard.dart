import 'package:flutter/material.dart';

import 'package:responsive_grid_list/responsive_grid_list.dart';

class PolicCard extends StatelessWidget{
  PolicCard({super.key, required EdgeInsets margin, required Align child, required MaterialColor color });
  final List<String> entries = <String>['SP', 'DYSP', 'PI','PSI', 'MEN POLICE', 'WOMAN POLICE','HG','GRD','SRP'];


  @override
  Widget build(BuildContext context) {
    return ResponsiveGridList(
        horizontalGridMargin: 0,
        verticalGridMargin: 20,
        minItemWidth: 148,
        children: List.generate(9,
        (index) => SizedBox(
          height: 180,
          child: Card(
            shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.white, //<-- SEE HERE
          ),
          borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.all(1),
      color: Colors.grey,
      child: Column(
          children:  [
            Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.only(top:80),
              child: Center(child: Text(' ${entries[index]}', style:const TextStyle(fontSize: 16))),
            ),
            Container(
              height:65,
              padding:const EdgeInsets.only(top:5),
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Container(

                    padding: const EdgeInsets.all(14),

                    child: const Align( child: Text('0', style:TextStyle(fontSize: 26)),),
                  ),

                  Container(

                    padding: const EdgeInsets.all(14),

                    // Align however you like (i.e .centerRight, centerLeft)
                    child: const Align( child: Text('0', style:TextStyle(fontSize: 28,color: Colors.red,)),),

                  ),
                ],
              ),
            ) ,
          ],
      ),
    ),
        )
    )
    );

  }

}