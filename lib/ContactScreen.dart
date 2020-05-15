import 'package:flutter/material.dart';

import 'app_drawer.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Contact'),
      ),
    );
  }
}
