import 'package:emailapp2020/message.dart';
import 'package:flutter/material.dart';

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
                TextFormField(
                  validator: (value) => !value.contains('@') ? '请正确填写邮箱' : null,
                  onSaved: (value) => to = value,
                  decoration: InputDecoration(
                    labelText: 'TO',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  onSaved: (value) => subject = value,
                  decoration: InputDecoration(
                    labelText: 'SUBJECT',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                TextFormField(
                  onSaved: (value) => body = value,
                  decoration: InputDecoration(
                    labelText: 'BODY',
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
