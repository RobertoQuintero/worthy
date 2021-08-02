import 'package:flutter/material.dart';

showAlert(
    BuildContext context, String titulo, String mensaje, Function() onPressed) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => AlertDialog(
            title: Text(titulo),
            content: Text(mensaje),
            actions: [
              MaterialButton(
                  child: Text('Cancelar'),
                  onPressed: () => Navigator.of(context).pop()),
              MaterialButton(child: Text('Ok'), onPressed: onPressed),
            ],
          ));
}

simpleDialog(BuildContext context, String title, String content) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              MaterialButton(
                  child: Text('Ok'), onPressed: () => Navigator.pop(context)),
            ],
          ));
}
