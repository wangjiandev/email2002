import 'package:emailapp2020/model/contact.dart';
import 'package:emailapp2020/observer.dart';
import 'package:flutter/material.dart';

class ContactListBuilder extends StatelessWidget {
  @required
  final Function builder;
  final Stream stream;

  const ContactListBuilder({Key key, this.builder, this.stream})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer<List<Contact>>(
      stream: stream,
      onSuccess: (BuildContext context, List<Contact> data) {
        return builder(context, data);
      },
      onWaiting: (context) => LinearProgressIndicator(),
    );
  }
}
