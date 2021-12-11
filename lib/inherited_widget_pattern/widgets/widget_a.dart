import 'dart:js';

import 'package:flutter/material.dart';

import '../pages/home_page.dart';

class WidgetA extends StatelessWidget {
  const WidgetA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('called WidgetA#build');
    final HomePageState state = HomePage.of(context);
    return Center(
      child: Text(
        '${state.count}',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
