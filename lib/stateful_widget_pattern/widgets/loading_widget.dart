import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget(this._isLoading, {Key? key}) : super(key: key);

  final bool _isLoading;

  @override
  Widget build(BuildContext context) {
    print('called LoadingWidget#build');
    return _isLoading
        ? const DecoratedBox(
            decoration: BoxDecoration(color: Color(0x44000000)),
            child: Center(child: CircularProgressIndicator()))
        : const SizedBox.shrink();
  }
}
