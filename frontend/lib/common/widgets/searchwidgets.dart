// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:frontend/common/widgets/uihelper.dart';

class Searchwidgets {
  static Widget Searchbarbelowtag({
    required String text,
    String? imgurl,
    required double width,
  }) {
    return Container(
      height: 32,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white24),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imgurl != null) ...[
            UiHelper.CustomImage(imgurl: imgurl),
            const SizedBox(width: 5),
          ],
          Text(
            text,
            style: const TextStyle(fontSize: 14, color: Color(0xfff9f9f9)),
          ),
        ],
      ),
    );
  }
}
