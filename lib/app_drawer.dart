import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
