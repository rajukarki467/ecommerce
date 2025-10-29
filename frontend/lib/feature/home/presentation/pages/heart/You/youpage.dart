import 'package:flutter/material.dart';
import 'package:frontend/common/widgets/uihelper.dart';

class Youpage extends StatelessWidget {
  const Youpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 48,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  "Follow Request",
                  style: TextStyle(fontSize: 15, color: Color(0xfff9f9f9)),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 106,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Text("New", style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: ListTile(
                      leading: UiHelper.CustomImage(imgurl: "Oval (4).png"),
                      title: Text(
                        "kareenne Liked your photo.  1h",
                        style: TextStyle(fontSize: 13),
                      ),
                      trailing: UiHelper.CustomImage(imgurl: "Rectangle.png"),
                    ),
                  ),
                ],
              ),
            ),

            //........................
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 20),
                Text("Today", style: TextStyle(fontSize: 15)),
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: ListTile(
                leading: UiHelper.CustomImage(imgurl: "Profiles.png"),
                title: Text(
                  "kareenne Liked your photo.  1h",
                  style: TextStyle(fontSize: 13),
                ),
                trailing: UiHelper.CustomImage(imgurl: "Rectangle.png"),
              ),
            ),

            //........................
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 20),
                Text("This Week", style: TextStyle(fontSize: 15)),
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: ListTile(
                leading: UiHelper.CustomImage(imgurl: "Oval (5).png"),
                title: Text(
                  "kareenne Liked your photo.  1h",
                  style: TextStyle(fontSize: 13),
                ),
                trailing: UiHelper.CustomImage(imgurl: "Rectangle.png"),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: ListTile(
                leading: UiHelper.CustomImage(imgurl: "Oval (6).png"),
                title: Text(
                  "kareenne Liked your photo.  1h",
                  style: TextStyle(fontSize: 13),
                ),
                trailing: UiHelper.CustomImage(imgurl: "Rectangle.png"),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: ListTile(
                leading: UiHelper.CustomImage(imgurl: "Oval (7).png"),
                title: Text(
                  "kareenne Liked your photo.  1h",
                  style: TextStyle(fontSize: 13),
                ),
                trailing: Container(
                  height: 30,
                  width: 90,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white54),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(child: Text("Message")),
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: ListTile(
                leading: UiHelper.CustomImage(imgurl: "Oval (8).png"),
                title: Text(
                  "kareenne Liked your photo.  1h",
                  style: TextStyle(fontSize: 13),
                ),
                trailing: Container(
                  height: 30,
                  width: 90,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white54),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(child: Text("Message")),
                ),
              ),
            ),

            //........................
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 20),
                Text("This Months", style: TextStyle(fontSize: 15)),
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: ListTile(
                leading: UiHelper.CustomImage(imgurl: "Oval (5).png"),
                title: Text(
                  "kareenne Liked your photo.  1h",
                  style: TextStyle(fontSize: 13),
                ),
                trailing: UiHelper.CustomImage(imgurl: "Rectangle.png"),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: ListTile(
                leading: UiHelper.CustomImage(imgurl: "Oval (6).png"),
                title: Text(
                  "kareenne Liked your photo.  1h",
                  style: TextStyle(fontSize: 13),
                ),
                trailing: UiHelper.CustomImage(imgurl: "Rectangle.png"),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: ListTile(
                leading: UiHelper.CustomImage(imgurl: "Oval (7).png"),
                title: Text(
                  "kareenne Liked your photo.  1h",
                  style: TextStyle(fontSize: 13),
                ),
                trailing: Container(
                  height: 30,
                  width: 90,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white54),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(child: Text("Message")),
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: ListTile(
                leading: UiHelper.CustomImage(imgurl: "Oval (8).png"),
                title: Text(
                  "kareenne Liked your photo.  1h",
                  style: TextStyle(fontSize: 13),
                ),
                trailing: Container(
                  height: 30,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    border: Border.all(color: Colors.white54),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(child: Text("Follow")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
