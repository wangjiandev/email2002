import 'package:emailapp2020/contact_manager.dart';
import 'package:emailapp2020/model/contact.dart';
import 'package:flutter/material.dart';

import 'ContactSearchDelegate.dart';
import 'app_drawer.dart';
import 'contact_list_builder.dart';

class ContactScreen extends StatelessWidget {
  ContactManager manager = ContactManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        actions: <Widget>[
          Chip(
            label: StreamBuilder<int>(
                stream: manager.contactCounter,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data ?? 0}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
            backgroundColor: Colors.red,
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: ContactSearchDelegate(manager: manager));
              }),
          SizedBox(width: 16),
        ],
      ),
      drawer: AppDrawer(),
      body: ContactListBuilder(
        stream: manager.contactListNow,
        builder: (context, contacts) {
          return ListView.separated(
            itemBuilder: (context, index) {
              Contact contact = contacts[index];
              return ListTile(
                title: Text(contact.name),
                subtitle: Text(contact.email),
                leading: CircleAvatar(),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: contacts?.length ?? 0,
          );
        },
      ),
    );
  }
}
