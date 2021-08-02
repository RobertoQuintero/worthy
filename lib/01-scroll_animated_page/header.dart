import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff373698),
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          SizedBox(
            width: 100,
          ),
          Icon(Icons.favorite_rounded, color: Colors.white),
          SizedBox(
            width: 10,
          ),
          Text(
            'Freelancer',
            style: GoogleFonts.nunito(color: Colors.white, fontSize: 18),
          ),
          SizedBox(
            width: 150,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeaderNav(text: 'Home', selected: true),
              SizedBox(
                width: 40,
              ),
              HeaderNav(text: 'Find a Team', selected: false),
              SizedBox(
                width: 40,
              ),
              HeaderNav(text: 'Publish a Project', selected: false),
              SizedBox(
                width: 40,
              ),
              HeaderNav(text: 'About', selected: false),
            ],
          ),
          SizedBox(width: 150),
          Row(
            children: [
              Text(
                'Sign Up',
                style: GoogleFonts.nunito(fontSize: 13, color: Colors.white),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 20,
                width: 1,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Log In',
                style: GoogleFonts.nunito(fontSize: 13, color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}

class HeaderNav extends StatefulWidget {
  final String text;
  final bool selected;
  const HeaderNav({Key? key, required this.text, required this.selected})
      : super(key: key);

  @override
  _HeaderNavState createState() => _HeaderNavState();
}

class _HeaderNavState extends State<HeaderNav> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.text,
          style: GoogleFonts.nunito(fontSize: 13, color: Colors.white),
        ),
        widget.selected
            ? SizedBox(
                height: 5,
              )
            : SizedBox()
      ],
    );
  }
}
