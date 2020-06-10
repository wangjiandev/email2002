import 'dart:async';

import 'package:emailapp2020/model/contact.dart';
import 'package:emailapp2020/service/contact_service.dart';
import 'package:rxdart/rxdart.dart';

class ContactManager {
  // StreamController 不能多次订阅
  // BehaviorSubject 允许多次订阅
  final BehaviorSubject<int> _contactCounter = BehaviorSubject<int>();
  Stream<int> get contactCounter => _contactCounter.stream;

  Stream<List<Contact>> get contactListNow =>
      Stream.fromFuture(ContactService.browse());

  Stream<List<Contact>> filteredCollection({query}) =>
      Stream.fromFuture(ContactService.browse(query: query));

  ContactManager() {
    contactListNow.listen((list) => _contactCounter.add(list.length));
  }
}
