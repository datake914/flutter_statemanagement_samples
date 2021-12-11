import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pages/home_page.dart';

class WidgetC extends StatelessWidget {
  const WidgetC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      print('called WidgetC#build');
      final notifier = ref.read(homePageProvider.notifier);
      return ElevatedButton(
          onPressed: () {
            notifier.increment();
          },
          child: const Icon(Icons.add));
    });
  }
}
