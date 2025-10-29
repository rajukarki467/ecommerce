import 'package:flutter/material.dart';
import 'package:frontend/common/widgets/uihelper.dart';
import 'package:frontend/feature/home/presentation/pages/profile/postpage.dart';
import 'package:frontend/feature/home/presentation/pages/profile/tagsscreens.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiHelper.CustomImage(imgurl: "lock.png"),
              SizedBox(width: 5),
              Text(
                "Raju_k",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: UiHelper.CustomImage(imgurl: "Shape.png"),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 15),
                UiHelper.CustomImage(imgurl: "Oval.png"),
                SizedBox(width: 30),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "54",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Posts",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Text(
                          "665",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Followers",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),

                    Column(
                      children: [
                        Text(
                          "800",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Following",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                SizedBox(width: 30),
                Text(
                  "Raju Karki",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                SizedBox(width: 30),
                Text(
                  "Digital goodies designer ....",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 30),
                Text(
                  "Everythings is designs ",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 30,
              width: 340,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Edit Profile ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(6),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                          border: Border.all(color: Colors.grey.shade700),
                        ),
                        child: Center(child: Icon(Icons.add, size: 40)),
                      ),
                      SizedBox(height: 5),
                      Text("New", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  SizedBox(width: 15),
                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                          border: Border.all(color: Colors.grey.shade700),
                        ),
                        child: UiHelper.CustomImage(imgurl: "Oval (1).png"),
                      ),
                      SizedBox(height: 5),
                      Text("New", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  SizedBox(width: 15),
                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                          border: Border.all(color: Colors.grey.shade700),
                        ),
                        child: UiHelper.CustomImage(imgurl: "Oval (1).png"),
                      ),
                      SizedBox(height: 5),
                      Text("Friends", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  SizedBox(width: 15),
                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                          border: Border.all(color: Colors.grey.shade700),
                        ),
                        child: UiHelper.CustomImage(imgurl: "Oval (2).png"),
                      ),
                      SizedBox(height: 5),
                      Text("Sports", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  SizedBox(width: 15),
                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                          border: Border.all(color: Colors.grey.shade700),
                        ),
                        child: UiHelper.CustomImage(imgurl: "Oval (3).png"),
                      ),
                      SizedBox(height: 5),
                      Text("Designs", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(icon: UiHelper.CustomImage(imgurl: "Grid Icon.png")),
                      Tab(icon: UiHelper.CustomImage(imgurl: "Tags Icon.png")),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(children: [Postpage(), Tagsscreens()]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
