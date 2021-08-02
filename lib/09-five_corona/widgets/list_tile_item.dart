import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:worthy/09-five_corona/models/task_model.dart';

class ListTileItem extends StatelessWidget {
  final TaskModel task;

  const ListTileItem({Key? key, required this.task}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => task.saved
          ? null
          : Navigator.pushNamed(context, 'set_task', arguments: task),
      child: Column(children: [
        ListTileTheme(
          tileColor: Colors.white,
          child: ListTile(
            title: Text(
              task.verificationItem,
              style: GoogleFonts.raleway(
                  fontSize: 17, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              task.description,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.lato(fontSize: 16),
            ),
            leading: Hero(
              tag: 'hero-${task.id}',
              child: CircleAvatar(
                backgroundColor:
                    task.saved ? Colors.green : Theme.of(context).primaryColor,
                child: Text(task.id, style: TextStyle(color: Colors.white)),
              ),
            ),
            trailing: task.saved ? null : Icon(Icons.edit),
          ),
        ),
      ]),
    );
  }
}
