import 'package:flutter/material.dart';

class WidgetC extends StatelessWidget {
  const WidgetC(this._increment, {Key? key}) : super(key: key);

  final void Function() _increment;

  @override
  Widget build(BuildContext context) {
    print('called WidgetC#build');
    return ElevatedButton(
        onPressed: () {
          _increment();
        },
        child: const Icon(Icons.add));
  }
}
