import 'package:flutter/material.dart';

class ColorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FittedBox(
        child: Column(
          children: [
            Row(
              children: [
                GradientCard(
                  color: Colors.lightBlue,
                  saturation: 1,
                ),
                GradientCard(
                  color: Colors.lightBlue,
                ),
                GradientCard(
                  color: Colors.lightBlue,
                  saturation: 2,
                ),
                GradientCard(
                  color: Colors.blue,
                  saturation: 1,
                ),
                GradientCard(
                  color: Colors.blue,
                ),
                GradientCard(
                  color: Colors.blue,
                  saturation: 2,
                ),
              ],
            ),
            Row(
              children: [
                GradientCard(
                  color: Colors.purple,
                  saturation: 1,
                ),
                GradientCard(
                  color: Colors.purple,
                ),
                GradientCard(
                  color: Colors.purple,
                  saturation: 2,
                ),
                GradientCard(
                  color: Colors.deepPurple,
                  saturation: 1,
                ),
                GradientCard(
                  color: Colors.deepPurple,
                ),
                GradientCard(
                  color: Colors.deepPurple,
                  saturation: 2,
                ),
              ],
            ),
            Row(
              children: [
                GradientCard(
                  color: Colors.orange,
                  saturation: 1,
                ),
                GradientCard(
                  color: Colors.orange,
                ),
                GradientCard(
                  color: Colors.orange,
                  saturation: 2,
                ),
                GradientCard(
                  color: Colors.deepOrange,
                  saturation: 1,
                ),
                GradientCard(
                  color: Colors.deepOrange,
                ),
                GradientCard(
                  color: Colors.deepOrange,
                  saturation: 2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GradientCard extends StatelessWidget {
  final MaterialColor color;
  final int saturation;
  const GradientCard({
    Key? key,
    required this.color,
    this.saturation = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                if (saturation <= 0 || saturation >= 3) ...[
                  color.shade300,
                  color.shade400,
                  color,
                ],
                if (saturation == 1) ...[
                  color.shade100,
                  color.shade200,
                  color.shade300,
                ],
                if (saturation == 2) ...[
                  color.shade500,
                  color.shade800,
                  color.shade900,
                ],
              ],
              stops: [
                .2,
                .6,
                .9
              ]),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 5, offset: Offset(-1, 2))
          ]),
    );
  }
}
