import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/feature/home/presentation/pages/heart/heartscreen.dart';
import 'package:frontend/feature/home/presentation/pages/home.dart';
import 'package:frontend/feature/home/presentation/pages/profile/profilescreen.dart';
import 'package:frontend/feature/home/presentation/pages/search/searchScreen.dart';
import 'package:frontend/feature/home/presentation/pages/post/uploadpost.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomePage(),
    Searchscreen(),
    UploadPostScreen(),
    Heartscreen(),
    Profilescreen(),
  ];

  List<String> label = ["Home", "Search", "Post", "Heart", "Profile"];
  List<Icon> icons = [
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(CupertinoIcons.plus_app),
    Icon(CupertinoIcons.heart),
    Icon(CupertinoIcons.profile_circled),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          for (int i = 0; i < pages.length; i++)
            BottomNavigationBarItem(icon: icons[i], label: label[i]),
        ],
      ),
      body: IndexedStack(children: pages, index: currentIndex),
    );
  }
}
