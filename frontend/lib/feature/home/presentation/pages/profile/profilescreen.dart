import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/common/widgets/uihelper.dart';
import 'package:frontend/feature/auth/data/datasources/local_user_service.dart'; // Import LocalUserService
import 'package:frontend/feature/auth/data/models/hive_user.dart';
import 'package:frontend/feature/home/presentation/pages/profile/postpage.dart';
import 'package:frontend/feature/home/presentation/pages/profile/tagsscreens.dart';
import 'package:frontend/service_locator.dart'; // Import HiveUser model

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localUserService = sl<LocalUserService>();
    HiveUser? currentUser = localUserService.getUser();

    if (currentUser == null) {
      return Center(child: Text("User not logged in"));
    }

    // Display the user's information
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
                currentUser
                    .firstName, // Display the logged-in user's first name
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
                  currentUser.firstName +
                      " " +
                      currentUser.lastName, // Display full name
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
                  "Everything is designs",
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
                  // Repeat for other columns...
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
                    child: TabBarView(
                      children: [
                        PostFeedScreen(
                          currentUser: currentUser.firstName,
                        ), // Pass currentUser here
                        Tagsscreens(),
                      ],
                    ),
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
