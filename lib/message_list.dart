import 'package:emailapp2020/message.dart';
import 'package:emailapp2020/message_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MessageList extends StatefulWidget {
  final String status;

  const MessageList({Key key, this.status}) : super(key: key);

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
    this.future = Message.browse(status: widget.status);
    this.messages = await this.future;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
                return Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  child: ListTile(
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
                  ),
                  actions: <Widget>[
                    IconSlideAction(
                      caption: 'Archive',
                      color: Colors.blue,
                      icon: Icons.archive,
                      onTap: () {},
                    ),
                    IconSlideAction(
                      caption: 'Share',
                      color: Colors.indigo,
                      icon: Icons.share,
                      onTap: () {},
                    ),
                  ],
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'More',
                      color: Colors.black45,
                      icon: Icons.more_horiz,
                      onTap: () {},
                    ),
                    IconSlideAction(
                      caption: '删除',
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () {
                        setState(() {
                          messages.removeAt(index);
                        });
                      },
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: messages.length,
            );
        }
      },
    );
  }
}
