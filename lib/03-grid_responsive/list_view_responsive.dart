import 'package:flutter/material.dart';

class ListViewResponsive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [RowOne(), RowTwo()],
      ),
    );
  }
}

class RowOne extends StatelessWidget {
  const RowOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      direction: Axis.horizontal,
      children: [
        Flexible(
          child: Container(
            color: Colors.red[50],
            child: Text(
                'Ex enim nulla proident eiusmod commodo ullamco quis mollit. Magna exercitation consectetur magna Lorem do officia minim. Ullamco ad elit est fugiat occaecat sint non. Mollit nostrud laborum excepteur incididunt consectetur.'),
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            width: double.infinity,
            color: Colors.red[200],
            child: Text('Ea nisi in nisi dolor.'),
          ),
        ),
      ],
    );
  }
}

class RowTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flex(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      direction: Axis.horizontal,
      children: [
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.blue[50],
            child: Text(
                'Ex enim nulla proident eiusmod commodo ullamco quis mollit. Magna exercitation consectetur magna Lorem do officia minim. Ullamco ad elit est fugiat occaecat sint non. Mollit nostrud laborum excepteur incididunt consectetur.'),
          ),
        ),
        Flexible(
          child: Container(
            width: double.infinity,
            color: Colors.blue[200],
            child: Text('Ea nisi in nisi dolor.'),
          ),
        ),
      ],
    );
  }
}
