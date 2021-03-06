import 'package:emailapp2020/app_drawer.dart';
import 'package:emailapp2020/compose_button.dart';
import 'package:emailapp2020/message_list.dart';
import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Inbox"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "Important"),
              Tab(text: "Other"),
            ],
          ),
        ),
        drawer: AppDrawer(),
        body: TabBarView(
          children: <Widget>[
            MessageList(status: "Important"),
            MessageList(status: "Other"),
          ],
        ),
        floatingActionButton: ComposeButton(messages: []),
      ),
    );
  }
}
