import 'package:flutter/material.dart';
import 'package:healthmate/Screen/Page_covid.dart';
import 'package:healthmate/Screen/Page_hospital.dart';
import 'package:healthmate/Screen/Page_home.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({super.key});

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  int MyCurrentIndex = 0;
  List pages = [hospital(), covid(), home()];

  @override
  Widget build(BuildContext context) {
    Widget MyNavBar = BottomNavigationBar(
        currentIndex: MyCurrentIndex,
        onTap: (int index){
          setState(() {
            MyCurrentIndex = index;
          });
        },
        items: [
      BottomNavigationBarItem(icon: Icon(Icons.home),label: 'หน้าแรก'),
      BottomNavigationBarItem(icon: Icon(Icons.local_hospital),label: 'โรงพยาบาล'),
      BottomNavigationBarItem(icon: Icon(Icons.coronavirus),label: 'สถิติโควิด-19'),
    ]);

    Widget MyDrawer = Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everyt
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.lightBlueAccent,
              backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.NTGuErH23W1cjfWw-dgFcgHaE7?rs=1&pid=ImgDetMain'),
            ),
            accountName: Text('Teeraphat Yeesai'),
            accountEmail: Text('teeraphat.y@ku.th'),

          ),


          ListTile(
            leading: Icon(Icons.home),
            title: const Text('หน้าหลัก'),
            subtitle: Text('หน้าเมนูการใช้งาน'),
            trailing: Icon(Icons.keyboard_arrow_right_rounded),
            onTap: () {},
          ),


          ListTile(
            leading: Icon(Icons.local_hospital_rounded),
            title: const Text('โรงพยาบาล'),
            subtitle: Text('ตำแหน่งโรงพยาบาล'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.coronavirus),
            title: const Text('โควิด19'),
            subtitle: Text('รายงานโควิด19'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),


        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Health Mate"),
      ),
      drawer: MyDrawer,
      body: pages[MyCurrentIndex],
      bottomNavigationBar: MyNavBar,
    );
  }
}
