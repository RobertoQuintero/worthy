import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

const kHeroImage =
    'https://images.unsplash.com/photo-1573152958734-1922c188fba3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=890&q=80';

class Parallax extends StatefulWidget {
  @override
  _ParallaxState createState() => _ParallaxState();
}

class _ParallaxState extends State<Parallax> {
  double offset = 0;
  GlobalKey _key = GlobalKey();
  double _y = 0;

  // this function is trigger when the user presses the floating button
  void _getOffset(GlobalKey key) {
    RenderBox box = key.currentContext!.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);
    setState(() {
      _y = position.dy;

      print(_y);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Material(
        child: NotificationListener(
          onNotification: updateOffsetAccordingToScroll,
          child: ScrollConfiguration(
            behavior: NoScrollGrow(),
            child: Stack(
              children: [
                Positioned(
                  top: -0.25 * offset,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: kHeroImage,
                    height: size.height,
                    width: size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: -0.25 * offset,
                  child: SizedBox(
                    height: size.height,
                    width: size.width,
                    child: Align(
                      alignment: Alignment(0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sint ad voluptate pariatur nostrud.',
                            style: TextStyle(backgroundColor: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Pariatur exercitation officia ut fugiat. Est eu dolor nisi adipisicing enim velit proident aute ullamco. Voluptate ipsum amet ad minim. Ex esse sint non in cillum anim.',
                            style: TextStyle(backgroundColor: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height,
                      ),
                      Container(
                        width: size.width,
                        height: size.height,
                        color: Colors.blueAccent,
                      ),
                      Container(
                        key: _key,
                        width: 360,
                        height: 200,
                        padding: EdgeInsets.all(30),
                        color: Colors.amber,
                        child: Text(
                          '$_y',
                          style: TextStyle(fontSize: 24),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _getOffset(_key), child: Icon(Icons.calculate)),
    );
  }

  bool updateOffsetAccordingToScroll(ScrollNotification scrollNotification) {
    setState(() {
      offset = scrollNotification.metrics.pixels;
      if (_y == 0) {
        _getOffset(_key);
        print('Y: $_y firs time');
      }
      print(offset);
    });
    return true;
  }
}

class NoScrollGrow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
