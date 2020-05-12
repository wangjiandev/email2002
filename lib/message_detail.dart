import 'package:flutter/material.dart';

class MessageDetail extends StatelessWidget {
  final String subject;
  final String message;

  const MessageDetail({Key key, this.subject, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.subject),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Text(this.message),
        ),
      ),
    );
  }
}
