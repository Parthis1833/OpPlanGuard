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
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                   
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 115 , 0, 0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                      child: Text(
                        'ઈ બંદોબસ્ત ',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                        ),
                      ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                ),
                title: const Text('Page 1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.train,
                ),
                title: const Text('Page 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.account_box_outlined,
                ),
                title: const Text('Page 3'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.add_card_outlined,
                ),
                title: const Text('Page 4'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.abc_outlined,
                ),
                title: const Text('Page 5'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      body: const Center(child: Text('Press the button below!')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: const Color.fromARGB(128, 73, 89, 110),
        child: const Icon(
            Icons.add_circle_outline,
            color: Colors.deepPurple,
            size: 56.4,

        ),
      ),
    );
  }
}