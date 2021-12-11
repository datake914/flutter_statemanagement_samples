import 'package:flutter/material.dart';

import '../pages/home_page.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget(this.homePageLogic, {Key? key}) : super(key: key);

  final HomePageLogic homePageLogic;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: homePageLogic.isLoading,
        builder: (context, snapshot) {
          print('called LoadingWidget#build');
          return snapshot.data ?? false
              ? const DecoratedBox(
                  decoration: BoxDecoration(color: Color(0x44000000)),
                  child: Center(child: CircularProgressIndicator()))
              : const SizedBox.shrink();
        });
  }
}
