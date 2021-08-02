import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTile extends StatelessWidget {
  final double left, top, factor;
  final String subtitle, title;
  const ProfileTile(
      {Key? key,
      required this.left,
      required this.top,
      required this.factor,
      required this.subtitle,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      top: top,
      left: left,
      child: Container(
        padding: EdgeInsets.all(8 * factor),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 5 * factor),
                  blurRadius: 5 * factor)
            ]),
        child: Row(
          children: [
            CircleAvatar(
              radius: 12 * factor,
              backgroundColor: Colors.grey[800],
              child: Icon(
                Icons.mail_outline_rounded,
                size: 12 * factor,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.nunito(
                      fontSize: 9 * factor, color: Colors.black),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.nunito(
                      fontSize: 8 * factor, color: Colors.black87),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
