import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Centers extends StatefulWidget {
  const Centers({Key? key}) : super(key: key);

  @override
  _CentersState createState() => _CentersState();
}

class _CentersState extends State<Centers> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: Text("centres")),
      ),
    );
  }
}
