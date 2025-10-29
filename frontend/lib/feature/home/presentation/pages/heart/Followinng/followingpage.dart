import 'package:flutter/material.dart';
import 'package:frontend/common/widgets/uihelper.dart';

class Followingpage extends StatelessWidget {
  const Followingpage({super.key});

  @override
  Widget build(BuildContext context) {
    var arrContent = [
      {
        "img": "Oval (1).png",
        "txt": "Hey, how are you?",
        "im1": "Rectangle.png",
      },
      {
        "img": "Oval (2).png",
        "txt": "Let’s meet tomorrow.",
        "im1": "Rectangle.png",
      },
      {
        "img": "Oval (3).png",
        "txt": "I’ll call you later.",
        "im1": "Rectangle.png",
      },
      {
        "img": "Oval (4).png",
        "txt": "Did you finish the work?",
        "im1": "Rectangle.png",
      },
      {"img": "Oval (5).png", "txt": "Good morning!", "im1": "Rectangle.png"},
      {"img": "Oval (6).png", "txt": "See you soon.", "im1": "Rectangle.png"},
      {
        "img": "Oval (7).png",
        "txt": "Thanks for your help!",
        "im1": "Rectangle.png",
      },
      {
        "img": "Oval (8).png",
        "txt": "What’s the plan today?",
        "im1": "Rectangle.png",
      },
    ];

    return Scaffold(
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListTile(
                  leading: UiHelper.CustomImage(
                    imgurl: arrContent[index]['img'].toString(),
                  ),
                  title: Text(
                    arrContent[index]['txt'].toString(),
                    style: TextStyle(fontSize: 14),
                  ),
                  trailing: UiHelper.CustomImage(
                    imgurl: arrContent[index]['im1'].toString(),
                  ),
                ),
              );
            },
            itemCount: arrContent.length,
          ),
        ),
      ),
    );
  }
}
