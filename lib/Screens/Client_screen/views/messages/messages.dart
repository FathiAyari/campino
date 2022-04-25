import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffe3eaef),
        body: Center(child: Text("Messages")),
      ),
    );
  }
}
