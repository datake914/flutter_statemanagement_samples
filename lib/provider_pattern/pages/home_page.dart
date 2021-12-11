import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Provider Pattern')),
      body: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('called HomePage#build');
    return ChangeNotifierProvider<HomePageState>(
      create: (context) {
        return HomePageState();
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

class HomePageState extends ChangeNotifier {
  int count = 0;
  bool isLoading = false;

  void increment() {
    isLoading = true;
    notifyListeners();
    Future.delayed(const Duration(seconds: 1)).then((_) {
      count++;
    }).whenComplete(() {
      isLoading = false;
      notifyListeners();
    });
  }
}
