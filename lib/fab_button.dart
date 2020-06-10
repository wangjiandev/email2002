import 'package:flutter/material.dart';
import 'package:emailapp2020/ugly_provider.dart';

class FabButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var state = UglyProvider.of(context);
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: state.increment,
    );
  }
}
