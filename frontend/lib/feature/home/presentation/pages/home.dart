import 'package:flutter/material.dart';
import 'package:frontend/common/widgets/uihelper.dart';
import 'package:frontend/feature/home/presentation/pages/messages/messages_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var arrHomeContent = [
      {
        "name": "Your Story",
        "img":
            "https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8",
      },
      {
        "name": "kareena",
        "img":
            "https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      },
      {
        "name": "Zackjhon",
        "img":
            "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
      },
      {
        "name": "suman",
        "img":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0G-W3JsDJFxxtbina79OHNYIDSb9wB0M6kUN1ZDNmLd41CKdr-1sO7gGNp2yp3cw4zGQ&usqp=CAU",
      },
      {
        "name": "Your Story",
        "img":
            "https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8",
      },
      {
        "name": "kareena",
        "img":
            "https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      },
      {
        "name": "Zackjhon",
        "img":
            "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
      },
      {
        "name": "suman",
        "img":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0G-W3JsDJFxxtbina79OHNYIDSb9wB0M6kUN1ZDNmLd41CKdr-1sO7gGNp2yp3cw4zGQ&usqp=CAU",
      },
    ];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 88,
        backgroundColor: Colors.black12,
        leading: UiHelper.CustomImage(imgurl: "Camera Icon.png"),
        title: UiHelper.CustomImage(imgurl: "Instagram Logo (1).png"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: UiHelper.CustomImage(imgurl: "IGTV.png"),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessagesScreen()),
              );
            },
            icon: UiHelper.CustomImage(imgurl: "Messanger.png"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 90,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                              arrHomeContent[index]['img'].toString(),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            arrHomeContent[index]['name'].toString(),
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: arrHomeContent.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),

            // SizedBox(
            //   height: 30,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 20),
            //     child: ListView.builder(
            //       itemBuilder: (context, index) {
            //         return Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Text(
            //             arrHomeContent[index]['name'].toString(),
            //             style: TextStyle(fontSize: 12),
            //           ),
            //         );
            //       },
            //       itemCount: arrHomeContent.length,
            //       scrollDirection: Axis.horizontal,
            //     ),
            //   ),
            // ),
            Container(
              height: 54,
              width: double.infinity,
              color: Colors.black12,
              child: ListTile(
                leading: UiHelper.CustomImage(imgurl: "person1.png"),
                title: Text(
                  "joshus_1",
                  style: TextStyle(fontSize: 13, color: Color(0xfff9f9f9)),
                ),
                subtitle: Text(
                  "Tokyo ,Japan",
                  style: TextStyle(fontSize: 11, color: Color(0xfff9f9f9)),
                ),
                trailing: UiHelper.CustomImage(imgurl: "More Icon.png"),
              ),
            ),
            SizedBox(height: 8),
            Container(
              clipBehavior: Clip.antiAlias,
              height: 375,
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Image.asset(
                "assets/images/Rectangle (1).png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),

            Row(
              children: [
                SizedBox(width: 20),
                UiHelper.CustomImage(imgurl: "Like.png"),
                SizedBox(width: 20),
                UiHelper.CustomImage(imgurl: "Comment.png"),
                SizedBox(width: 20),
                UiHelper.CustomImage(imgurl: "Messanger.png"),
                SizedBox(width: 190),

                UiHelper.CustomImage(imgurl: "Save.png"),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 20),

                UiHelper.CustomImage(imgurl: "Ovalone.png"),
                SizedBox(width: 5),
                Text(
                  "Liked by craig love and 44,686 others.",
                  style: TextStyle(fontSize: 13, color: Color(0xfff9f9f9)),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                  "joshua_l",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xfff9f9f9),
                  ),
                ),
                Text(
                  " The game in Japan was amazing and I want ",
                  style: TextStyle(fontSize: 13, color: Color(0xfff9f9f9)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
