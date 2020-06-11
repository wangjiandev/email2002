import 'package:emailapp2020/manager/message_form_manager.dart';

import 'counter_manager.dart';
import 'contact_manager.dart';

class Overseer {
  Map<dynamic, dynamic> repository = {};

  Overseer() {
    register(ContactManager, ContactManager());
    register(CounterManager, CounterManager());
    register(MesssageFormManager, MesssageFormManager());
  }

  register(name, object) {
    repository[name] = object;
  }

  fetch(name) => repository[name];
}
