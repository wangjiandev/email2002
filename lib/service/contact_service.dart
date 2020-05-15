import 'package:emailapp2020/model/contact.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactService {
  static Future<List<Contact>> browse() async {
    http.Response response =
        await http.get("http://yapi.xiya.vip/mock/91/users");
    String content = response.body;
    List collection = json.decode(content);
    List<Contact> _contacts =
        collection.map((json) => Contact.fromJson(json)).toList();
    return _contacts;
  }
}
