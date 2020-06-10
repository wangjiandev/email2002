import 'package:emailapp2020/counter.dart';
import 'package:emailapp2020/fab_button.dart';
import 'package:flutter/material.dart';

import 'app_drawer.dart';

class CalenderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calender'),
      ),
      drawer: AppDrawer(),
      body: Counter(),
      floatingActionButton: FabButton(),
    );
  }
}
