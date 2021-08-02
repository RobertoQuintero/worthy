import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:worthy/01-scroll_animated_page/header.dart';
import 'package:worthy/01-scroll_animated_page/info_palette.dart';
import 'package:worthy/01-scroll_animated_page/profile_image.dart';
import 'package:worthy/01-scroll_animated_page/profile_tile.dart';

class ScrollAnimatedPage extends StatefulWidget {
  const ScrollAnimatedPage({
    Key? key,
  }) : super(key: key);

  @override
  _ScrollAnimatedPageState createState() => _ScrollAnimatedPageState();
}

class _ScrollAnimatedPageState extends State<ScrollAnimatedPage> {
  ScrollController? _controller;
  double pixels = 0.0;
  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller?.addListener(() {
      setState(() {
        pixels = _controller!.position.pixels;
        print(pixels);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            children: [
              Stack(
                children: [
                  Row(children: [
                    Container(
                      height: 600,
                      width: MediaQuery.of(context).size.width * 0.45,
                      color: Colors.white,
                      child: Stack(
                        children: [
                          Transform(
                            transform: Matrix4.rotationZ(pi / 6)
                              ..translate(-180, 170),
                            child: Container(
                              height: 350,
                              width: 700,
                              decoration: BoxDecoration(
                                  color: Colors.pink[300],
                                  borderRadius: BorderRadius.circular(300),
                                  border: Border.all(
                                      width: .3,
                                      color: Colors.white.withOpacity(.3)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.pink[200] as Color,
                                        blurRadius: 5,
                                        offset: Offset(4, 3))
                                  ]),
                            ),
                          ),
                          Positioned(
                            top: 200,
                            left: 100,
                            child: Container(
                              height: 400,
                              width: 400,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Manage all your',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 38,
                                          fontWeight: FontWeight.w700)),
                                  Text('projects in one place',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700)),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 300,
                                    child: Text(
                                        'Describe your project and find a top talent team around the world near you. Leave your E-mail to get invite for 30 days free trail',
                                        style: GoogleFonts.nunito(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300)),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 45,
                                        width: 230,
                                        child: TextField(
                                          decoration: InputDecoration(
                                              hintText:
                                                  'Enter your email address',
                                              hintStyle: GoogleFonts.nunito(
                                                  fontSize: 12),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50))),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      TextButton(
                                          style: TextButton.styleFrom(
                                              backgroundColor: Colors.black87,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30))),
                                          onPressed: () {},
                                          child: Container(
                                            height: 45,
                                            width: 100,
                                            child: Center(
                                              child: Text(
                                                'Get Invite',
                                                style: GoogleFonts.nunito(
                                                    color: Colors.white,
                                                    fontSize: 13),
                                              ),
                                            ),
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 600,
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width * .55,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ProfileImage(
                            top: 140,
                            left: 90,
                            diameter: 200,
                            image:
                                'https://images.unsplash.com/photo-1516575334481-f85287c2c82d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzF8fHBob3RvZ3JhcGhlcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                          ),
                          ProfileImage(
                            top: 160,
                            left: 310,
                            diameter: 100,
                            image:
                                'https://images.unsplash.com/photo-1598105006657-e20801526310?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzZ8fHBob3RvZ3JhcGhlcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                          ),
                          ProfileImage(
                            top: 275,
                            left: 280,
                            diameter: 280,
                            image:
                                'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8c21pbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                          ),
                          ProfileImage(
                            top: 360,
                            left: 90,
                            diameter: 170,
                            image:
                                'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHNtaWxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                          ),
                          ProfileTile(
                              left: 50,
                              top: 380,
                              factor: 0.7,
                              subtitle: 'Scarlett, Designer',
                              title: 'I am gonna give u Color theory'),
                          ProfileTile(
                              left: 40,
                              top: 140,
                              factor: 0.9,
                              subtitle: 'harshell, Photographer',
                              title: 'Photography is an Art, let\'s do it ryt'),
                          ProfileTile(
                              left: 360,
                              top: 240,
                              factor: 0.8,
                              subtitle: 'Robert, Designer',
                              title: 'I am gonna give u Color theory'),
                          ProfileTile(
                              left: 440,
                              top: 470,
                              factor: 1.1,
                              subtitle: 'Stephanie, Designer',
                              title: 'I am gonna give u Color theory'),
                        ],
                      ),
                    )
                  ]),
                  Header()
                ],
              ),
              Container(
                height: 400,
                width: double.infinity,
                color: Colors.white,
                child: Stack(
                  children: [
                    Positioned(
                        right: -200,
                        child: Container(
                          height: 330,
                          width: 430,
                          decoration: BoxDecoration(
                              color: Colors.blue[400],
                              borderRadius: BorderRadius.circular(300),
                              border: Border.all(
                                  width: .3,
                                  color: Colors.white.withOpacity(.3)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.blue[200] as Color,
                                    blurRadius: 5,
                                    // spreadRadius: 7,
                                    offset: Offset(-4, 3))
                              ]),
                        )),
                    Column(children: [
                      Text('How it works',
                          style: GoogleFonts.nunito(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                      SizedBox(height: 40),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AnimatedOpacity(
                              opacity: pixels >= 100 ? 1.0 : 0.0,
                              duration: Duration(milliseconds: 500),
                              child: AnimatedPadding(
                                duration: Duration(milliseconds: 500),
                                padding: EdgeInsets.only(
                                    left: pixels >= 100 ? 0 : 500),
                                child: InfoPalette(
                                  title: 'Community',
                                  text:
                                      'Communicate with colleagues, share ideas, find a team in a project in once place',
                                  icon: Icons.people_alt_rounded,
                                ),
                              ),
                            ),
                            InfoPalette(
                              title: 'Overview Reports',
                              text:
                                  'Communicate with colleagues, share ideas, find a team in a project in once place',
                              icon: Icons.pie_chart_rounded,
                            ),
                            InfoPalette(
                              title: 'Dashboard',
                              text:
                                  'Communicate with colleagues, share ideas, find a team in a project in once place',
                              icon: Icons.person_rounded,
                            ),
                          ]),
                      SizedBox(
                        height: 60,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                primary: Colors.black87,
                                padding: EdgeInsets.all(0)),
                            onPressed: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                      color: Colors.grey[800] as Color)),
                              child: Text(
                                'Explore More',
                                style: GoogleFonts.nunito(
                                    fontSize: 12, fontWeight: FontWeight.w800),
                              ),
                            )),
                      )
                    ])
                  ],
                ),
              ),
              Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                        left: -250,
                        child: Container(
                          height: 450,
                          width: 700,
                          decoration: BoxDecoration(
                            color: Colors.amber[400],
                            borderRadius: BorderRadius.circular(400),
                          ),
                        )),
                    AnimatedPositioned(
                        duration: Duration(milliseconds: 500),
                        top: 20,
                        left: pixels >= 500 ? 100 : 0,
                        child: Container(
                          height: 400,
                          width: 700,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.network(
                            'https://miro.medium.com/max/2400/0*qO2PFu6dr04R1O6P.png',
                            fit: BoxFit.cover,
                          ),
                        )),
                    ProfileTile(
                        left: 80,
                        top: 10,
                        factor: 1,
                        subtitle: 'Sara, Client',
                        title: 'Send a final design to the team'),
                    ProfileTile(
                        left: 620,
                        top: 400,
                        factor: 1,
                        subtitle: 'Micheal',
                        title: 'Publish Your Project whenever you want.'),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      right: pixels >= 600 ? 100 : 0,
                      top: 50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Easy Project Management',
                            style: GoogleFonts.nunito(
                                fontSize: 25, fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: 280,
                            child: Text(
                              'Sunt occaecat exercitation dolor ad cupidatat aute dolor fugiat ullamco magna ipsum pariatur ipsum.',
                              style: GoogleFonts.nunito(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextButton(
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100)),
                                  backgroundColor: Colors.grey[900],
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 20)),
                              onPressed: () {},
                              child: Container(
                                child: Center(
                                  child: Text(
                                    'Try for free',
                                    style: GoogleFonts.nunito(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
