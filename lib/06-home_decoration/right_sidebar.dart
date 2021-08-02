import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RightSideBar extends StatelessWidget {
  final double height;
  const RightSideBar({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: height,
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 35),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Transform.rotate(
                angle: pi + pi / 2,
                child: Container(
                  height: 120,
                  child: Center(
                    child: Text(
                      'AXIS STUDIO',
                      style: GoogleFonts.josefinSans(
                          fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
