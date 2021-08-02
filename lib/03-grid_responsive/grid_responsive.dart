import 'package:flutter/material.dart';

class GridResponsive extends StatefulWidget {
  @override
  _GridResponsiveState createState() => _GridResponsiveState();
}

class _GridResponsiveState extends State<GridResponsive> {
  int breakPoint = 1;
  void getBreakPoints(double width) {
    if (width > 0 && width < 440) {
      if (breakPoint != 1) {
        breakPoint = 1;
        setState(() {});
        print('1');
      }
    } else if (width > 440 && width < 760) {
      if (breakPoint != 2) {
        breakPoint = 2;
        setState(() {});
        print('2');
      }
    } else if (width > 760 && width < 990) {
      if (breakPoint != 3) {
        breakPoint = 3;
        setState(() {});
        print('3');
      }
    } else if (width > 990) {
      if (breakPoint != 4) {
        breakPoint = 4;
        setState(() {});
        print('4');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    getBreakPoints(size.width);

    return Scaffold(
        body: GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: breakPoint,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          child: Text("He'd have you all unravel at the"),
          color: Colors.teal[100],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Heed not the rabble'),
          color: Colors.teal[200],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Sound of screams but the'),
          color: Colors.teal[300],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Who scream'),
          color: Colors.teal[400],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Revolution is coming...'),
          color: Colors.teal[500],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Revolution, they...'),
          color: Colors.teal[600],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Revolution, they...'),
          color: Colors.teal[600],
        ),
      ],
    ));
  }
}
