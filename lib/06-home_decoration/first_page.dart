import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstPage extends StatefulWidget {
  final double height;
  final double width;
  const FirstPage(this.height, this.width);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  double containerTop = 0;
  double opacityHead = 0;
  double opacitySub = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        opacityHead = 1;
      });
    });
    Future.delayed(Duration(milliseconds: 800), () {
      setState(() {
        opacitySub = 1;
      });
    });
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        containerTop = widget.height;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            right: 80,
            child: Container(
                height: widget.height,
                width: widget.width * .4,
                child: Image.network(
                    'https://images.unsplash.com/photo-1618220179428-22790b461013?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aG9tZSUyMGRlY29yYXRpb258ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                    fit: BoxFit.cover,
                    alignment: Alignment(0.3, 0))),
          ),
          AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              top: containerTop,
              left: 70,
              child: Container(
                height: widget.height,
                width: widget.width,
                color: Colors.white,
              )),
          Positioned(
            top: widget.height * .24,
            left: 160,
            child: Container(
              height: widget.height,
              width: widget.width * .53,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedOpacity(
                    opacity: opacityHead,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                    child: Text(
                      'Decoration is what you need for your house !',
                      style: GoogleFonts.ubuntu(
                          fontSize: 80, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AnimatedOpacity(
                    opacity: opacitySub,
                    duration: Duration(milliseconds: 500),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Consequat ullamco cillum laborum et in',
                          style: GoogleFonts.raleway(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          'Sunt amet exercitation amet tempor mollit enim.',
                          style: GoogleFonts.raleway(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          'Nulla eu est eiusmod.',
                          style: GoogleFonts.raleway(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
