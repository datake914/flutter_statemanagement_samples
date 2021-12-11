import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/home_page.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('called LoadingWidget#build');
    final state = Provider.of<HomePageState>(context);
    return state.isLoading
        ? const DecoratedBox(
            decoration: BoxDecoration(color: Color(0x44000000)),
            child: Center(child: CircularProgressIndicator()))
        : const SizedBox.shrink();
  }
}
