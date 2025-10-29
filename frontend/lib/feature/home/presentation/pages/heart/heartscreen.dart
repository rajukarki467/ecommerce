import 'package:flutter/material.dart';
import 'package:frontend/feature/home/presentation/pages/heart/Followinng/followingpage.dart';
import 'package:frontend/feature/home/presentation/pages/heart/You/youpage.dart';

class Heartscreen extends StatelessWidget {
  const Heartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: "Following"),
              Tab(text: "You"),
            ],
          ),
        ),
        body: TabBarView(children: [Followingpage(), Youpage()]),
      ),
    );
  }
}
