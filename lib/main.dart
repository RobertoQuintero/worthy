import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worthy/09-five_corona/providers/audit_provider.dart';
import 'package:worthy/09-five_corona/providers/form_register_provider.dart';
import 'package:worthy/09-five_corona/screens/five_corona.dart';
import 'package:worthy/09-five_corona/screens/add_register.dart';
import 'package:worthy/09-five_corona/screens/set_task.dart';
import 'package:worthy/09-five_corona/services/request_services.dart';

import '09-five_corona/screens/image_detail.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RequestServices()),
        ChangeNotifierProvider(create: (_) => FormRegisterProvider()),
        ChangeNotifierProvider(create: (_) => AuditProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (_) => FiveCorona(),
        'add_register': (_) => AddRegister(),
        'set_task': (_) => SetTask(),
        'image_detail': (_) => ImageDetail()
      },
      theme: ThemeData.light().copyWith(
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.purple),
          primaryColor: Colors.purple,
          scaffoldBackgroundColor: Colors.white),
    );
  }
}
