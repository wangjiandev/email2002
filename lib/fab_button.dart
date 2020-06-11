import 'package:flutter/material.dart';

import 'counter_manager.dart';
import 'provider.dart';

class FabButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterManager manager = Provider.of(context).fetch(CounterManager);
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: manager.increment,
    );
  }
}
