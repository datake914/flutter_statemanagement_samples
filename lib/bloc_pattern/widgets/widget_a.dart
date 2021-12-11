import 'package:flutter/material.dart';

import '../pages/home_page.dart';

class WidgetA extends StatelessWidget {
  const WidgetA(this.homePageLogic, {Key? key}) : super(key: key);

  final HomePageLogic homePageLogic;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<int>(
          stream: homePageLogic.count,
          builder: (context, snapshot) {
            print('called WidgetA#build');
            return Text(
              '${snapshot.data}',
              style: Theme.of(context).textTheme.headline4,
            );
          }),
    );
  }
}
