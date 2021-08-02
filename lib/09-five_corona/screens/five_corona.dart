import 'package:flutter/material.dart';

class FiveCorona extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Almacén'),
        ),
        body: Center(
          child: Text('Hola mundo!'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, 'add_register'),
          child: Icon(Icons.add),
        ));
  }
}
