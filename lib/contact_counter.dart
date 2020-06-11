import 'package:emailapp2020/contact_manager.dart';
import 'package:emailapp2020/provider.dart';
import 'package:flutter/material.dart';

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context).fetch(ContactManager);
    return Chip(
      label: StreamBuilder<int>(
        stream: manager.count$,
        builder: (context, snapshot) {
          return Text(
            '${snapshot.data ?? 0}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
      backgroundColor: Colors.red,
    );
  }
}
