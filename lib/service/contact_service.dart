import 'package:emailapp2020/model/contact.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactService {
  static Future<List<Contact>> browse({String filter}) async {
    http.Response response =
        await http.get("http://yapi.xiya.vip/mock/91/users");
    String content = response.body;
    List collection = json.decode(content);
    Iterable<Contact> _contacts =
        collection.map((json) => Contact.fromJson(json));
    if (filter != null && filter.isNotEmpty) {
      _contacts = _contacts
          .where((contact) => contact.email.toLowerCase().contains(filter));
    }
    return _contacts.toList();
  }
}
