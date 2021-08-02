import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopBar extends StatefulWidget {
  final height, width;
  TopBar(this.height, this.width);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: 40,
        width: widget.width * 0.22,
        margin: EdgeInsets.only(top: 30, left: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Axis',
                style: GoogleFonts.josefinSans(
                    fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ),
            TopBarItem(
              text: 'About',
            ),
            TopBarItem(
              text: 'Search',
            ),
          ],
        ),
      ),
    );
  }
}

class TopBarItem extends StatefulWidget {
  final String text;

  TopBarItem({required this.text});

  @override
  _TopBarItemState createState() => _TopBarItemState();
}

class _TopBarItemState extends State<TopBarItem> {
  double hoverUnderLineWidth = 0;
  double hoverUnderLineHeight = 1.5;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MouseRegion(
            onEnter: (value) {
              setState(() {});
              hoverUnderLineWidth = 30;
            },
            onExit: (value) {
              setState(() {});
              hoverUnderLineWidth = 0;
            },
            child: Text(
              widget.text,
              style: GoogleFonts.raleway(
                  fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 100),
            height: hoverUnderLineHeight,
            width: hoverUnderLineWidth,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
