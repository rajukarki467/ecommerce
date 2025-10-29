import 'package:flutter/material.dart';
import 'package:frontend/common/widgets/searchwidgets.dart';
import 'package:frontend/common/widgets/uihelper.dart';
import 'package:frontend/core/utils/searcharray.dart';

class Searchscreen extends StatelessWidget {
  const Searchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          Row(
            children: [
              SizedBox(width: 10),
              Container(
                height: 34,
                width: 290,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff262626),
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: "search",
                    prefixIcon: UiHelper.CustomImage(imgurl: "Search Icon.png"),
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color(0xff8e8e93),
                      fontWeight: FontWeight.normal,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(width: 15),
              UiHelper.CustomImage(imgurl: "Live.png"),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 15),
              Searchwidgets.Searchbarbelowtag(
                text: "IGTV",
                imgurl: "Icon (2).png",
                width: 70,
              ),
              Searchwidgets.Searchbarbelowtag(
                text: "Shop",
                imgurl: "shopping.png",
                width: 70,
              ),
              Searchwidgets.Searchbarbelowtag(text: "Style", width: 55),
              Searchwidgets.Searchbarbelowtag(text: "Sports", width: 55),
              Searchwidgets.Searchbarbelowtag(text: "Auto", width: 45),
            ],
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return Container(
                  clipBehavior: Clip.antiAlias,
                  height: 124,
                  width: 124,
                  decoration: BoxDecoration(),
                  child: Image.network(
                    ContentData.arrContent[index].img,
                    fit: BoxFit.cover,
                  ),
                );
              },
              itemCount: ContentData.arrContent.length,
            ),
          ),
        ],
      ),
    );
  }
}
