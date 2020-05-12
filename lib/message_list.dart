import 'package:emailapp2020/compose_button.dart';
import 'package:emailapp2020/message.dart';
import 'package:emailapp2020/message_detail.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
              setState(() {
                this.future = Message.browse();
              });
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('wangjian'),
              accountEmail: Text('928647866@qq.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://graph.baidu.com/resource/121f63efdcfff7509567e01589298631.jpg'),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.inbox),
              title: Text('Inbox'),
              trailing: Chip(
                label: Text(
                  '11',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.blue,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.edit),
              title: Text('Draft'),
              onTap: () {},
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.archive),
              title: Text('Archive'),
              onTap: () {},
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.paperPlane),
              title: Text('Sent'),
              onTap: () {},
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.trash),
              title: Text('Trash'),
              onTap: () {},
            ),
            Divider(),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.cogs),
                  title: Text('Setting'),
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
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
      ),
      floatingActionButton: ComposeButton(messages: messages),
    );
  }
}
