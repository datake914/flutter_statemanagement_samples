import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/home_page.dart';

class WidgetA extends StatelessWidget {
  const WidgetA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('called WidgetA#build');
    // // ④ Provider.of<T>()を利用して状態を受け取る。引数のlistenを指定していないため、状態に変更が会った時にリビル
    // final state = Provider.of<HomePageState>(context);

    // return Center(
    //   child: Text(
    //     '${state.count}',
    //     style: Theme.of(context).textTheme.headline4,
    //   ),
    // );
    print('called WidgetA#build');
    final count = context.select<HomePageState, int>((state) {
      return state.count;
    });
    return Center(
      child: Text(
        '$count',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
