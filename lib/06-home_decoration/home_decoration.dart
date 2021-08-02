import 'package:flutter/material.dart';
import 'package:worthy/06-home_decoration/first_page.dart';
import 'package:worthy/06-home_decoration/right_sidebar.dart';
import 'package:worthy/06-home_decoration/top_bar.dart';

class HomeDecoration extends StatefulWidget {
  @override
  _HomeDecorationState createState() => _HomeDecorationState();
}

class _HomeDecorationState extends State<HomeDecoration> {
  late double height, width;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Stack(
        children: [
          FirstPage(height, width),
          TopBar(height, width),
          RightSideBar(height: height)
        ],
      ),
    );
  }
}
