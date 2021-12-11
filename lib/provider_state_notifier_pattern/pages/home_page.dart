import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:state_notifier/state_notifier.dart';

import '../widgets/widgets.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Provider State Notifier Pattern')),
      body: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('called HomePage#build');
    return StateNotifierProvider<HomePageStateNotifier, HomePageState>(
      create: (context) {
        return HomePageStateNotifier();
      },
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[WidgetA(), WidgetB(), WidgetC()],
          ),
          const LoadingWidget(),
        ],
      ),
    );
  }
}

@immutable
class HomePageState {
  const HomePageState({
    this.count = 0,
    this.isLoading = false,
  });

  final int count;
  final bool isLoading;

  HomePageState copyWith({int? count, bool? isLoading}) {
    return HomePageState(
        count: count ?? this.count, isLoading: isLoading ?? this.isLoading);
  }
}

class HomePageStateNotifier extends StateNotifier<HomePageState> {
  HomePageStateNotifier() : super(const HomePageState());

  void increment() {
    state = state.copyWith(isLoading: true);
    Future.delayed(const Duration(seconds: 1)).then((_) {
      state = state.copyWith(count: state.count + 1);
    }).whenComplete(() {
      state = state.copyWith(isLoading: false);
    });
  }
}
