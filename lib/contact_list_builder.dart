import 'package:emailapp2020/model/contact.dart';
import 'package:flutter/material.dart';

class ContactListBuilder extends StatelessWidget {
  @required
  final Function builder;
  final Stream stream;

  const ContactListBuilder({Key key, this.builder, this.stream})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Contact>>(
      stream: stream,
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
