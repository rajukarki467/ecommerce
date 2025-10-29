import 'package:flutter/material.dart';

class Tagsscreens extends StatelessWidget {
  const Tagsscreens({super.key});

  @override
  Widget build(BuildContext context) {
    var arrContent = [
      {
        "img":
            "https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg",
      },
      {
        "img":
            "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg",
      },
      {
        "img":
            "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg",
      },
      {"img": "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg"},
      {
        "img":
            "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg",
      },
      {
        "img":
            "https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg",
      },
    ];

    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: arrContent.length,
        itemBuilder: (context, index) => Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(),
          child: Image.network(arrContent[index]['img']!, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
