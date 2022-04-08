import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MarketplaceScreen extends StatefulWidget {
  const MarketplaceScreen({Key? key}) : super(key: key);


  @override
  _MarketplaceScreenState createState()=>_MarketplaceScreenState();
}
class _MarketplaceScreenState extends State<MarketplaceScreen> {
  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Text(
          'MarketPlace'
          , style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
        ), )



    );}}