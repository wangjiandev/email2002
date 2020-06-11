import 'dart:async';

import 'package:emailapp2020/validation/validation.dart';
import 'package:rxdart/rxdart.dart';

class MesssageFormManager with Validation {
  final _email = BehaviorSubject<String>.seeded('@');
  Stream<String> get email$ => _email.stream.transform(validateEmail);
  Sink<String> get inEmail => _email.sink;
}
