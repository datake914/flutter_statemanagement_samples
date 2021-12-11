import 'package:flutter/material.dart';

class WidgetA extends StatelessWidget {
  const WidgetA(this._count, {Key? key}) : super(key: key);

  final int _count;

  @override
  Widget build(BuildContext context) {
    print('called WidgetA#build');
    return Center(
      child: Text(
        '$_count',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
