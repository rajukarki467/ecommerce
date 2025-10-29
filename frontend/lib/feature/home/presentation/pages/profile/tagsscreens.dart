import 'package:flutter/material.dart';

class Tagsscreens extends StatelessWidget {
  const Tagsscreens({super.key});

  @override
  Widget build(BuildContext context) {
    var arrContent = [
      {
        "img":
            "https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      },
      {
        "img":
            "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      },
      {
        "img":
            "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      },
      {
        "img":
            "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      },
      {
        "img":
            "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      },
      {
        "img":
            "https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      },
      {
        "img":
            "https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      },
      {
        "img":
            "https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      },
      {
        "img":
            "https://images.pexels.com/photos/1467180/pexels-photo-1467180.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      },
      {
        "img":
            "https://images.pexels.com/photos/1704489/pexels-photo-1704489.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      },
    ];

    return Scaffold(
      body: Expanded(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return Container(
              clipBehavior: Clip.antiAlias,
              height: 120,
              width: 120,
              decoration: BoxDecoration(),
              child: Image.network(
                arrContent[index]['img'].toString(),
                fit: BoxFit.cover,
              ),
            );
          },
          itemCount: arrContent.length,
        ),
      ),
    );
  }
}
