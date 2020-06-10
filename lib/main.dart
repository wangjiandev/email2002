import 'package:emailapp2020/app.dart';
import 'package:emailapp2020/contact_manager.dart';
import 'package:flutter/material.dart';

import 'provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ContactManager>(
      data: ContactManager(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: App(),
      ),
    );
  }
}
