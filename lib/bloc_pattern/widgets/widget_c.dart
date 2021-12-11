import 'package:flutter/material.dart';

import '../pages/home_page.dart';

class WidgetC extends StatelessWidget {
  const WidgetC(this.homePageLogic, {Key? key}) : super(key: key);

  final HomePageLogic homePageLogic;

  @override
  Widget build(BuildContext context) {
    print('called WidgetC#build');
    return ElevatedButton(
        onPressed: () {
          homePageLogic.increment();
        },
        child: const Icon(Icons.add));
  }
}
