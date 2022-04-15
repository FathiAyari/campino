import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: Text("Posts")),
      ),
    );
  }
}
