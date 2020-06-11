import 'dart:async';

import 'package:emailapp2020/message.dart';
import 'package:emailapp2020/validation/validation.dart';
import 'package:rxdart/rxdart.dart';

class MesssageFormManager with Validation {
  final _email = BehaviorSubject<String>();
  Stream<String> get email$ => _email.stream.transform(validateEmail);
  Sink<String> get inEmail => _email.sink;

  final _subject = BehaviorSubject<String>();
  Stream<String> get subject$ => _subject.stream.transform(validateSubject);
  Sink<String> get inSubject => _subject.sink;

  final _body = BehaviorSubject<String>();
  Stream<String> get body$ => _body.stream;
  Sink<String> get inBody => _body.sink;

  Stream<bool> get isFormValid$ =>
      CombineLatestStream([email$, subject$, body$], (value) => true);

  Message submit() {
    String subject = _subject.value;
    String body = _body.value;

    return Message(subject, body);
  }
}
