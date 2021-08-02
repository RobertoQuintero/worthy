import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:worthy/09-five_corona/functions/show_dialog.dart';
import 'package:worthy/09-five_corona/models/audit_model.dart';
import 'package:worthy/09-five_corona/models/task_model.dart';
import 'package:worthy/09-five_corona/providers/audit_provider.dart';
import 'package:worthy/09-five_corona/providers/form_register_provider.dart';
import 'package:worthy/09-five_corona/screens/loading_page.dart';
import 'package:worthy/09-five_corona/services/request_services.dart';
import 'package:worthy/09-five_corona/widgets/app_button.dart';
import 'package:worthy/09-five_corona/widgets/list_tile_item.dart';

class AddRegister extends StatefulWidget {
  @override
  _AddRegisterState createState() => _AddRegisterState();
}

class _AddRegisterState extends State<AddRegister> {
  Uuid uuid = Uuid();
  @override
  void initState() {
    Provider.of<AuditProvider>(context, listen: false).auditId = uuid.v1();
    Provider.of<AuditProvider>(context, listen: false).area = 'Almacén';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final requestServices = Provider.of<RequestServices>(context);
    final formRegisterProvider = Provider.of<FormRegisterProvider>(context);

    if (requestServices.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashColor: Colors.transparent,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            showAlert(context, 'Abandonar registro',
                'Se perderán los datos guardados', () {
              formRegisterProvider.reset();
              requestServices.unSaved();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            });
          },
        ),
        title: Text('Agrega auditoria'),
      ),
      body: Stack(
        children: [
          _HeaderBox(),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: requestServices.tasks.length,
                itemBuilder: (_, index) {
                  final TaskModel task = requestServices.tasks[index];
                  return ListTileItem(task: task);
                }),
          ),
        ],
      ),
    );
  }
}

class _HeaderBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final requestServices = Provider.of<RequestServices>(context);
    final auditProvider = Provider.of<AuditProvider>(context);
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      color: Colors.amber,
      child: Align(
        alignment: Alignment.bottomRight,
        child: AppButton(
            child: Text('Terminar'),
            onPressed: requestServices.totalSaved
                ? () {
                    final audit = AuditModel(
                        auditId: auditProvider.auditId,
                        area: auditProvider.area,
                        allOk: auditProvider.allOk,
                        successRegisters: auditProvider.successRegisters,
                        date: DateTime.now());

                    requestServices.createAudit(audit).then((value) {
                      print(value);
                      Navigator.pop(context);
                      auditProvider.reset();
                    });
                    // auditProvider.reset();
                  }
                : () => simpleDialog(context, 'Verifica todas las tareas',
                    'Asegurate de haber agregado todas las tareas')),
      ),
    );
  }
}
