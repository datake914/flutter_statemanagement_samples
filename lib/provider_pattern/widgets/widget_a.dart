import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/home_page.dart';

class WidgetA extends StatelessWidget {
  const WidgetA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('called WidgetA#build');
    final state = Provider.of<HomePageState>(context);

    return Center(
      child: Text('${state.count}'),
    );
  }
}
