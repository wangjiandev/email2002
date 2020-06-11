import 'package:emailapp2020/counter_manager.dart';
import 'package:emailapp2020/provider.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterManager manager = Provider.of(context).fetch(CounterManager);
    return StreamBuilder<int>(
        initialData: 0,
        stream: manager.counter$,
        builder: (context, snapshot) {
          return Center(
            child: Text('data is ${snapshot.data}'),
          );
        });
  }
}
