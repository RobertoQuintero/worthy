import 'dart:math';

import 'package:flutter/material.dart';

class CustomFloatingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomFloatingActionButton(),
    );
  }
}

bool toggle = true;

class CustomFloatingActionButton extends StatefulWidget {
  const CustomFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  _CustomFloatingActionButtonState createState() =>
      _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState extends State<CustomFloatingActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Animation? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 350),
        reverseDuration: Duration(milliseconds: 275));

    _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn);

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  Alignment alignment1 = Alignment(0, 0);
  Alignment alignment2 = Alignment(0, 0);
  Alignment alignment3 = Alignment(0, 0);
  double size1 = 50;
  double size2 = 50;
  double size3 = 50;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Center(
        child: Container(
          height: 250,
          width: 250,
          child: Stack(
            children: [
              AnimatedAlign(
                duration: toggle
                    ? Duration(milliseconds: 275)
                    : Duration(milliseconds: 875),
                alignment: alignment1,
                curve: toggle ? Curves.easeIn : Curves.elasticOut,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 275),
                  curve: toggle ? Curves.easeIn : Curves.easeOut,
                  height: size1,
                  width: size1,
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(40)),
                  child: Icon(Icons.message, color: Colors.white),
                ),
              ),
              AnimatedAlign(
                duration: toggle
                    ? Duration(milliseconds: 275)
                    : Duration(milliseconds: 875),
                alignment: alignment2,
                curve: toggle ? Curves.easeIn : Curves.elasticOut,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 275),
                  curve: toggle ? Curves.easeIn : Curves.easeOut,
                  height: size2,
                  width: size2,
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(40)),
                  child: Icon(Icons.camera_alt, color: Colors.white),
                ),
              ),
              AnimatedAlign(
                duration: toggle
                    ? Duration(milliseconds: 275)
                    : Duration(milliseconds: 875),
                alignment: alignment3,
                curve: toggle ? Curves.easeIn : Curves.elasticOut,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 275),
                  curve: toggle ? Curves.easeIn : Curves.easeOut,
                  height: size3,
                  width: size3,
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(40)),
                  child: Icon(Icons.phone, color: Colors.white),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Transform.rotate(
                  angle: _animation?.value * pi * (3 / 4),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 375),
                    curve: Curves.easeOut,
                    height: toggle ? 70 : 60,
                    width: toggle ? 70 : 60,
                    decoration: BoxDecoration(
                        color: Colors.yellow[600],
                        borderRadius: BorderRadius.circular(60)),
                    child: Material(
                      color: Colors.transparent,
                      child: IconButton(
                        splashColor: Colors.black54,
                        splashRadius: 31,
                        icon: FittedBox(
                          child: Icon(
                            Icons.add,
                            size: 57,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            if (toggle) {
                              toggle = !toggle;
                              _controller.forward();
                              Future.delayed(Duration(milliseconds: 10), () {
                                alignment1 = Alignment(-0.7, -0.4);
                                size1 = 50;
                              });
                              Future.delayed(Duration(milliseconds: 10), () {
                                alignment2 = Alignment(0, -0.8);
                                size2 = 50;
                              });
                              Future.delayed(Duration(milliseconds: 10), () {
                                alignment3 = Alignment(0.7, -0.4);
                                size3 = 50;
                              });
                            } else {
                              toggle = !toggle;
                              _controller.reverse();
                              alignment1 = Alignment(0, 0);
                              alignment2 = Alignment(0, 0);
                              alignment3 = Alignment(0, 0);
                              size1 = size2 = size3 = 20;
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
