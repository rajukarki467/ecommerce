import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/widgets/uihelper.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchcontroller = TextEditingController();
    var arrContent = [
      {"img": "Oval (1).png", "name": "Ravi", "lastmsg": "Good morning ☀️"},
      {"img": "Oval (2).png", "name": "Anisha", "lastmsg": "See you soon 😊"},
      {
        "img": "Oval (3).png",
        "name": "Suman",
        "lastmsg": "That was awesome! 🔥",
      },
      {"img": "Oval (4).png", "name": "Kritika", "lastmsg": "Can’t wait 😍"},
      {"img": "Oval (5).png", "name": "Prakash", "lastmsg": "On the way 🚗💨"},
      {
        "img": "Oval (6).png",
        "name": "Bishal",
        "lastmsg": "Let’s play tonight 🎮",
      },
      {
        "img": "Oval (7).png",
        "name": "Niraj",
        "lastmsg": "Haha that’s funny 😂",
      },
      {"img": "Oval (8).png", "name": "Pooja", "lastmsg": "Take care ❤️"},
      {"img": "Oval (1).png", "name": "Ravi", "lastmsg": "Good morning ☀️"},
      {"img": "Oval (2).png", "name": "Anisha", "lastmsg": "See you soon 😊"},
      {
        "img": "Oval (3).png",
        "name": "Suman",
        "lastmsg": "That was awesome! 🔥",
      },
      {"img": "Oval (4).png", "name": "Kritika", "lastmsg": "Can’t wait 😍"},
      {"img": "Oval (5).png", "name": "Prakash", "lastmsg": "On the way 🚗💨"},
      {
        "img": "Oval (6).png",
        "name": "Bishal",
        "lastmsg": "Let’s play tonight 🎮",
      },
      {
        "img": "Oval (7).png",
        "name": "Niraj",
        "lastmsg": "Haha that’s funny 😂",
      },
      {"img": "Oval (8).png", "name": "Pooja", "lastmsg": "Take care ❤️"},
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 88,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back),
        ),
        title: Text(
          "Sujal_dave",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xfff9f9f9),
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, color: Colors.white, size: 24),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 20),

              Container(
                height: 36,
                width: 315,
                decoration: BoxDecoration(
                  color: Color(0xff262626),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: TextField(
                    controller: searchcontroller,
                    decoration: InputDecoration(
                      hintText: "search",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color(0xff8e8e93),
                      ),
                      prefixIcon: UiHelper.CustomImage(
                        imgurl: "Search Icon.png",
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                      "assets/images/${arrContent[index]["img"].toString()}",
                    ),
                  ),

                  title: Text(
                    arrContent[index]["name"].toString(),
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    arrContent[index]["lastmsg"].toString(),
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  trailing: UiHelper.CustomImage(imgurl: "Picture.png"),
                );
              },
              itemCount: arrContent.length,
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xff121212)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiHelper.CustomImage(imgurl: "Icon (4).png"),
              SizedBox(width: 5),
              Text(
                "Camera",
                style: TextStyle(fontSize: 13, color: Color(0xff3897f0)),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
