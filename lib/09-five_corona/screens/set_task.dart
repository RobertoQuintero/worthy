import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:worthy/09-five_corona/functions/images_handler.dart';
import 'package:worthy/09-five_corona/functions/show_dialog.dart';
import 'package:worthy/09-five_corona/models/register_model.dart';
import 'package:worthy/09-five_corona/models/task_model.dart';
import 'package:worthy/09-five_corona/providers/audit_provider.dart';
import 'package:worthy/09-five_corona/providers/form_register_provider.dart';
import 'package:worthy/09-five_corona/services/request_services.dart';
import 'package:worthy/09-five_corona/widgets/app_button.dart';
import 'package:worthy/09-five_corona/widgets/image_grid_item.dart';
import 'package:worthy/09-five_corona/widgets/transparent_scaffold.dart';

class SetTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final task = ModalRoute.of(context)?.settings.arguments as TaskModel;
    final formRegisterProvider = Provider.of<FormRegisterProvider>(context);
    final requestServices = Provider.of<RequestServices>(context);
    final auditProvider = Provider.of<AuditProvider>(context);

    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: BouncingScrollPhysics(),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 50,
              ),
              _QuestionWidget(task: task),
              SizedBox(
                height: 40,
              ),
              _FormBody()
            ]),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.save),
            onPressed: formRegisterProvider.checked ||
                    formRegisterProvider.description.trim().length > 10
                ? () async {
                    final register = new RegisterModel(
                        idTask: task.id,
                        area: task.area,
                        sector: task.sector,
                        images: [],
                        imagesSolved: [],
                        registerDescription: formRegisterProvider.description,
                        registerDescriptionSolved: '',
                        isOk: formRegisterProvider.checked,
                        auditId: auditProvider.auditId,
                        date: DateTime.now());

                    auditProvider.registers.add(register);

                    await requestServices.createRegister(
                        task, formRegisterProvider.images, register);
                    task.saved = true;
                    formRegisterProvider.reset();
                    Navigator.pop(context);
                  }
                : () => simpleDialog(context, 'Falta descripción',
                    'Documenta detalladamente el porqué no se cumple la orden'),
          ),
        ),
        if (requestServices.isLoading) TransparentScaffold()
      ],
    );
  }
}

class _FormBody extends StatefulWidget {
  const _FormBody({
    Key? key,
  }) : super(key: key);

  @override
  __FormBodyState createState() => __FormBodyState();
}

class __FormBodyState extends State<_FormBody> {
  bool done = false;
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final formRegisterProvider = Provider.of<FormRegisterProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('No / Si'),
              SizedBox(
                width: 8,
              )
            ],
          ),
          SwitchListTile.adaptive(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                '¿Se cumple?',
                style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
              ),
              activeColor: Theme.of(context).primaryColor,
              value: formRegisterProvider.checked,
              onChanged: (value) {
                formRegisterProvider.checked = value;
                setState(() {});
              }),
          TextField(
            keyboardType: TextInputType.multiline,
            controller: _controller,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2)),
                labelText: 'Descripción (Opcional)',
                labelStyle: TextStyle(color: Colors.grey),
                hintText: 'En caso de no cumplirse...'),
            onChanged: (value) {
              formRegisterProvider.description = value;
              print(value);
              setState(() {});
            },
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Imágenes(opcional)',
                style: GoogleFonts.lato(fontSize: 17),
              ),
              Row(
                children: [
                  AppButton(
                      child: Icon(Icons.photo_camera),
                      onPressed: () {
                        print('camera');
                        ImagesHandler.getImages('camera').then((image) {
                          if (image != null) {
                            formRegisterProvider.images.add(image);
                            print(image.path);
                            setState(() {});
                          }
                        });
                      }),
                  SizedBox(
                    width: 5,
                  ),
                  AppButton(
                      child: Icon(Icons.photo_library),
                      onPressed: () {
                        print('gallery');
                        ImagesHandler.getImages('gallery').then((image) {
                          if (image != null) {
                            formRegisterProvider.images.add(image);
                            print(image.path);
                            setState(() {});
                          }
                        });
                      }),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(5),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: formRegisterProvider.images.length,
            itemBuilder: (BuildContext context, int index) {
              var image = File(formRegisterProvider.images[index]!.path);
              return ImageGridItem(image: image);
            },
          ),
        ],
      ),
    );
  }
}

class _QuestionWidget extends StatelessWidget {
  const _QuestionWidget({
    Key? key,
    required this.task,
  }) : super(key: key);

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: 'hero-${task.id}',
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: Text(
                task.id,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              radius: 30,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.verificationItem,
                  style: GoogleFonts.lato(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  task.description,
                  style: GoogleFonts.lato(fontSize: 17),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
