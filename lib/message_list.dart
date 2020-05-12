import 'package:emailapp2020/compose_button.dart';
import 'package:emailapp2020/message.dart';
import 'package:emailapp2020/message_detail.dart';
import 'package:flutter/material.dart';

class MessageList extends StatefulWidget {
  MessageList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  Future<List<Message>> future;
  List<Message> messages = [];

  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
    this.future = Message.browse();
    this.messages = await this.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              var _messages = Message.browse();
              setState(() {
                this.future = _messages;
              });
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<List<Message>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                    child: Text("There was an error ${snapshot.error}"));
              }
              List<Message> messages = snapshot.data;
              return ListView.separated(
                itemBuilder: (context, index) {
                  Message message = messages[index];
                  return ListTile(
                    title: Text(message.subject),
                    subtitle: Text(message.body),
                    leading: CircleAvatar(
                      child: Text('PQ'),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return MessageDetail(
                              subject: message.subject,
                              message: message.body,
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: messages.length,
              );
          }
        },
      ),
      floatingActionButton: ComposeButton(messages: messages),
    );
  }
}
