import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pages/home_page.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      print('called LoadingWidget#build');
      final isLoading = ref.watch(homePageProvider.select((state) {
        return state.isLoading;
      }));
      return isLoading
          ? const DecoratedBox(
              decoration: BoxDecoration(color: Color(0x44000000)),
              child: Center(child: CircularProgressIndicator()))
          : const SizedBox.shrink();
    });
  }
}
