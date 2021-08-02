import 'package:flutter/material.dart';

class BreakPoints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CenterContainer(
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(
                  child: Text(
                    'Proident esse in anim in sunt proident non laborum ut. Consectetur anim amet sunt aute anim do. Lorem ut consequat nisi eu culpa duis deserunt dolore fugiat eu laboris minim laborum culpa. Labore et elit irure eiusmod commodo pariatur sint est ad nostrud incididunt. Magna ad in do laboris ad tempor incididunt minim do pariatur laborum incididunt. Aliquip dolore eiusmod nisi non. Dolor incididunt irure irure culpa aliqua veniam eu non officia sunt.',
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Text(
                    'Proident esse in anim in sunt proident non laborum ut. Consectetur anim amet sunt aute anim do. Lorem ut consequat nisi eu culpa duis deserunt dolore fugiat eu laboris minim laborum culpa. Labore et elit irure eiusmod commodo pariatur sint est ad nostrud incididunt. Magna ad in do laboris ad tempor incididunt minim do pariatur laborum incididunt. Aliquip dolore eiusmod nisi non. Dolor incididunt irure irure culpa aliqua veniam eu non officia sunt.',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CenterContainer extends StatefulWidget {
  final Widget child;
  const CenterContainer({Key? key, required this.child}) : super(key: key);

  @override
  _CenterContainerState createState() => _CenterContainerState();
}

class _CenterContainerState extends State<CenterContainer> {
  //400 576 768 992 1200 1400
  double maxWidth = 400;

  getMaxWidth(double width) {
    if (width > 0 && width < 576) {
      if (maxWidth != 400) {
        maxWidth = 400;
        setState(() {});
      }
    } else if (width > 576 && width < 768) {
      if (maxWidth != 576) {
        maxWidth = 576;
        setState(() {});
      }
    } else if (width > 768 && width < 992) {
      if (maxWidth != 768) {
        maxWidth = 768;
        setState(() {});
      }
    } else if (width > 992 && width < 1200) {
      if (maxWidth != 992) {
        maxWidth = 992;
        setState(() {});
      }
    } else if (width > 1200 && width < 1400) {
      if (maxWidth != 1100) {
        maxWidth = 1100;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    getMaxWidth(size.width);
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(maxWidth: maxWidth),
        padding: EdgeInsets.all(15),
        color: Colors.amber,
        child: widget.child,
      ),
    );
  }
}
