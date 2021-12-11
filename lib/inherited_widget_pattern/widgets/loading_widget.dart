import 'package:flutter/material.dart';

import '../pages/home_page.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('called LoadingWidget#build');
    final HomePageState state = HomePage.of(context);
    return state.isLoading
        ? const DecoratedBox(
            decoration: BoxDecoration(color: Color(0x44000000)),
            child: Center(child: CircularProgressIndicator()))
        : const SizedBox.shrink();
  }
}
