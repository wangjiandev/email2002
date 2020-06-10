import 'package:emailapp2020/contact_manager.dart';
import 'package:emailapp2020/model/contact.dart';
import 'package:flutter/material.dart';

import 'app_drawer.dart';

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
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          SizedBox(width: 16),
        ],
      ),
      drawer: AppDrawer(),
      body: StreamBuilder(
        stream: manager.contactListNow,
        builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              List<Contact> contacts = snapshot.data;
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
          }
          return Container();
        },
      ),
    );
  }
}
