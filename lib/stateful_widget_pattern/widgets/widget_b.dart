import 'package:flutter/material.dart';

class WidgetB extends StatelessWidget {
  const WidgetB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('called WidgetB#build');
    return const Text(
      'You have pushed the button this many times:',
    );
  }
}
