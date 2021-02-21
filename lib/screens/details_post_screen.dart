import 'package:expanded_cell/models/post_model.dart';
import 'package:expanded_cell/utils.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PostDetails extends StatelessWidget {
  Post post;

  PostDetails({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.mainBg,
          appBar: AppBar(
            title: Text("Details"),
            backgroundColor: AppColors.appBar,
          ),
          body: Container(
              color: AppColors.mainBg,
              padding: EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: TextStyle(
                        fontSize: AppFontSizes.heading, color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    post.body,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.left,
                  )
                ],
              ))),
        );
      },
    );
  }
}
