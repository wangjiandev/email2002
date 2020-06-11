import 'dart:async';

import 'package:emailapp2020/model/contact.dart';
import 'package:emailapp2020/service/contact_service.dart';
import 'package:rxdart/rxdart.dart';

class ContactManager {
  // 搜索关键字流
  final PublishSubject<String> _filterSubject = PublishSubject<String>();
  // StreamController 不能多次订阅
  // BehaviorSubject 允许多次订阅
  // 个数统计流
  final PublishSubject<int> _countSubject = PublishSubject<int>();
  // 联系人列表流
  final PublishSubject<List<Contact>> _collectionSubject =
      PublishSubject<List<Contact>>();

  // 获取搜索关键字流的入口
  Sink<String> get inFilter => _filterSubject.sink;

  Stream<int> get count$ => _countSubject.stream;

  Stream<List<Contact>> get browse$ => _collectionSubject.stream;

  ContactManager() {
    // 监听关键字变化
    _filterSubject.stream.listen((filter) async {
      // 根据关键字过滤联系人列表
      var contacts = await ContactService.browse(filter: filter);
      // 将新联系人列表发送到联系人列表流
      _collectionSubject.add(contacts);
    });
    // 监听联系人列表流变化，并统计联系人数发送到个数统计流
    _collectionSubject.listen((list) => _countSubject.add(list.length));
  }

  void dispose() {
    _filterSubject.close();
    _countSubject.close();
  }
}
