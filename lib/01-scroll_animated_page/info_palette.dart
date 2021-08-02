import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoPalette extends StatelessWidget {
  final String title, text;
  final IconData icon;
  const InfoPalette(
      {Key? key, required this.title, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: Colors.grey[900], borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, size: 22, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Text(title,
            style:
                GoogleFonts.nunito(fontWeight: FontWeight.w800, fontSize: 18)),
        SizedBox(
          height: 15,
        ),
        Container(
          width: 200,
          child: Text(
            text,
            style: GoogleFonts.nunito(
                fontWeight: FontWeight.w400,
                color: Colors.black54,
                fontSize: 14),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Learn more...',
          style: GoogleFonts.nunito(fontWeight: FontWeight.w800, fontSize: 14),
        ),
        Container(
          height: 1.5,
          width: 90,
          color: Colors.black87,
        )
      ],
    );
  }
}
