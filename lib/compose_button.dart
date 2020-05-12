import 'package:emailapp2020/message.dart';
import 'package:flutter/material.dart';

import 'message_compose.dart';

class ComposeButton extends StatelessWidget {
  final List<Message> messages;

  const ComposeButton({Key key, this.messages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        Message message = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => MessageCompose(),
          ),
        );

        if (null != message) {
          messages.add(message);
          Scaffold.of(context).hideCurrentSnackBar();
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    width: 20,
                  ),
                  Text(message.subject),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
