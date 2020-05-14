import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'message.g.dart';

@JsonSerializable()
class Message {
  final String subject;
  final String body;

  Message(this.subject, this.body);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  static Future<List<Message>> browse({status = 'Important'}) async {
    var url = status == 'Important'
        ? 'http://yapi.xiya.vip/mock/91/messages/important'
        : 'http://yapi.xiya.vip/mock/91/messages/other';

    http.Response response = await http.get(url);

    // await Future.delayed(Duration(seconds: 2));

    String data = response.body;
    List collection = json.decode(data);
    List<Message> _messages =
        collection.map((json) => Message.fromJson(json)).toList();
    return _messages;
  }
}
