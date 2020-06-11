import 'package:emailapp2020/message.dart';
import 'package:emailapp2020/observer.dart';
import 'package:emailapp2020/provider.dart';
import 'package:flutter/material.dart';

import 'manager/message_form_manager.dart';

class MessageCompose extends StatefulWidget {
  @override
  _MessageComposeState createState() => _MessageComposeState();
}

class _MessageComposeState extends State<MessageCompose> {
  String to = "";
  String subject = "";
  String body = "";

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MesssageFormManager manager =
        Provider.of(context).fetch(MesssageFormManager);
    return Scaffold(
      appBar: AppBar(
        title: Text("Message Compose"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Observer(
                  stream: manager.email$,
                  onSuccess: (context, data) {
                    return TextField(
                      onChanged: manager.inEmail.add,
                      decoration: InputDecoration(
                        labelText: '收件人',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                  onError: (context, error) {
                    return TextField(
                      onChanged: manager.inEmail.add,
                      decoration: InputDecoration(
                        labelText: '收件人',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        errorText: error,
                      ),
                    );
                  },
                ),
                TextFormField(
                  onSaved: (value) => subject = value,
                  decoration: InputDecoration(
                    labelText: '主题',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                TextFormField(
                  onSaved: (value) => body = value,
                  decoration: InputDecoration(
                    labelText: '内容',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  maxLines: 15,
                ),
                ListTile(
                  title: RaisedButton(
                    child: Text(
                      'Send',
                    ),
                    onPressed: () {
                      this.key.currentState.save();
                      if (this.key.currentState.validate()) {
                        Message message = Message(subject, body);
                        Navigator.pop(context, message);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
