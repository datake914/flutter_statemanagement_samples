import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pages/home_page.dart';

class WidgetA extends StatelessWidget {
  const WidgetA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      print('called WidgetA#build');
      final count = ref.watch(homePageProvider.select((state) {
        return state.count;
      }));
      return Center(
        child: Text(
          '$count',
          style: Theme.of(context).textTheme.headline4,
        ),
      );
    });
  }
}
