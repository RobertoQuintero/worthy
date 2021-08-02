import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Widget child;
  final Function() onPressed;
  const AppButton({Key? key, required this.child, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style:
            ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
        onPressed: onPressed,
        child: child);
  }
}
