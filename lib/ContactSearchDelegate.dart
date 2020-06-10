import 'package:flutter/material.dart';

import 'contact_list_builder.dart';
import 'model/contact.dart';

class ContactSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => '搜索';

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 1) {
      return Center(
        child: Text('最少输入1个字符'),
      );
    }
    return ContactListBuilder(
      // stream: manager.filteredCollection(query: query),
      builder: (context, contacts) {
        return ListView.separated(
          itemBuilder: (context, index) {
            Contact contact = contacts[index];
            return ListTile(
              title: Text(contact.name),
              subtitle: Text(contact.email),
              leading: CircleAvatar(),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: contacts?.length ?? 0,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
