import 'package:flutter/material.dart';

import '../pages/home_page.dart';

class WidgetC extends StatelessWidget {
  const WidgetC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('called WidgetC#build');
    final HomePageState state = HomePage.of(context, listen: false);

    return ElevatedButton(
        onPressed: () {
          state.increment();
        },
        child: const Icon(Icons.add));
  }
}
