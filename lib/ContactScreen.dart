import 'package:emailapp2020/contact_counter.dart';
import 'package:emailapp2020/model/contact.dart';
import 'package:flutter/material.dart';

import 'ContactSearchDelegate.dart';
import 'app_drawer.dart';
import 'contact_list_builder.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        actions: <Widget>[
          ContactCounter(),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: ContactSearchDelegate());
              }),
          Padding(
            padding: EdgeInsets.only(right: 16.0),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ContactListBuilder(
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
