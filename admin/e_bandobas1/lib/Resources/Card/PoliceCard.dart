import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PolicCard extends StatelessWidget{
  PolicCard({super.key, required EdgeInsets margin, required Align child, required MaterialColor color });
  final List<String> entries = <String>['SP', 'DYSP', 'PI','PSI', 'MEN POLICE', 'WOMAN POLICE','HG','GRD','SRP'];


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(3.5),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 9,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        return
          // child: Text(' ${entries[index]}'),
            Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.white, //<-- SEE HERE
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: const EdgeInsets.all(5),
              color: Colors.grey,
               child: Column(
                children:  [
                  Container(
                    padding: const EdgeInsets.all(2),
                    margin:const EdgeInsets.only(top:63),
                      child: Text(' ${entries[index]}', style:const TextStyle(fontSize: 19)),
                           ),
                  Container(
                    height: 60,
                    padding:const EdgeInsets.only(top:5),
                    alignment: Alignment.bottomCenter,
                    child: Row(
                  children:[
                    Container(
                      width:25,
                        alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left:24),

                       child: const Align( child: Text('0', style:TextStyle(fontSize: 26)),),
                      ),

                    Container(
                      width: 60,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(bottom: 2),
                      margin: const EdgeInsets.only(left:70),
                      // Align however you like (i.e .centerRight, centerLeft)
                      child: const Align( child: Text('0', style:TextStyle(fontSize: 28,color: Colors.red,)),),

                    ),
                  ],
               ),
              ) ,
                ],
               ),
        );
      },
    );
  }

}