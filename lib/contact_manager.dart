import 'dart:async';

import 'package:emailapp2020/model/contact.dart';
import 'package:emailapp2020/service/contact_service.dart';
import 'package:rxdart/rxdart.dart';

class ContactManager {
  // StreamController 不能多次订阅
  // BehaviorSubject 允许多次订阅
  final BehaviorSubject<int> _contactCount = BehaviorSubject<int>();

  Stream<int> get count$ => _contactCount.stream;
  Stream<List<Contact>> browse$({String filter}) =>
      Stream.fromFuture(ContactService.browse(filter: filter));

  ContactManager() {
    browse$().listen((list) => _contactCount.add(list.length));
  }

  void dispose() {
    _contactCount.close();
  }
}
