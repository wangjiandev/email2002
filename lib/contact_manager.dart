import 'dart:async';

import 'package:emailapp2020/model/contact.dart';
import 'package:emailapp2020/service/contact_service.dart';

class ContactManager {
  final StreamController<int> _contactCounter = StreamController<int>();
  Stream<int> get contactCounter => _contactCounter.stream;

  Stream<List<Contact>> get contactListNow async* {
    yield await ContactService.browse();
  }

  ContactManager() {
    contactListNow.listen((list) => _contactCounter.add(list.length));
  }
}
