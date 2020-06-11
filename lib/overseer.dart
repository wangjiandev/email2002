import 'counter_manager.dart';
import 'contact_manager.dart';

class Overseer {
  Map<dynamic, dynamic> repository = {};

  Overseer() {
    register(ContactManager, ContactManager());
    register(CounterManager, CounterManager());
  }

  register(name, object) {
    repository[name] = object;
  }

  fetch(name) => repository[name];
}
