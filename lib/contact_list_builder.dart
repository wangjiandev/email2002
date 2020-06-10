import 'package:emailapp2020/model/contact.dart';
import 'package:flutter/material.dart';

import 'contact_manager.dart';
import 'provider.dart';

class ContactListBuilder extends StatelessWidget {
  @required
  final Function builder;

  const ContactListBuilder({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of<ContactManager>(context);
    return StreamBuilder<List<Contact>>(
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
            return builder(context, contacts);
        }
        return Container();
      },
    );
  }
}
