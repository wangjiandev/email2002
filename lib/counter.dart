import 'package:emailapp2020/counter_manager.dart';
import 'package:emailapp2020/provider.dart';
import 'package:flutter/material.dart';

import 'observer.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterManager manager = Provider.of(context).fetch(CounterManager);
    return Observer<int>(
        stream: manager.counter$,
        onSuccess: (context, data) {
          return Center(
            child: Text('data is $data'),
          );
        });
  }
}
