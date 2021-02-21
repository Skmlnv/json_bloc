import 'package:flutter/material.dart';

class Utils {
  static String apiPosts = "https://jsonplaceholder.typicode.com/posts";
}

class AppColors {
  static Color appBar = Color(0xff212121);
  static Color mainBg = Color(0xff303030);
  static Color cellBg = Color(0xff424242);
}

class AppFontSizes {
  static double heading = 24.0;
  static double title = 18.0;
  static double text = 14.0;
}

Widget loader() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget error(String message) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        message,
        style: TextStyle(color: Colors.red),
      ),
    ),
  );
}
