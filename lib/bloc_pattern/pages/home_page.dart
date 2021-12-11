import 'dart:async';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLoC Pattern')),
      body: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  HomePageLogic? homePageLogic;

  @override
  void initState() {
    super.initState();
    homePageLogic = HomePageLogic();
  }

  @override
  Widget build(BuildContext context) {
    print('called _HomePageState#build');
    return Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            WidgetA(homePageLogic!),
            const WidgetB(),
            WidgetC(homePageLogic!)
          ],
        ),
        LoadingWidget(homePageLogic!)
      ],
    );
  }

  @override
  void dispose() {
    homePageLogic!.dispose();
    super.dispose();
  }
}

class HomePageLogic {
  HomePageLogic() {
    _countController.sink.add(_count);
    _loadingController.sink.add(false);
  }

  final _countController = StreamController<int>();
  final _loadingController = StreamController<bool>();

  int _count = 0;

  Stream<int> get count {
    return _countController.stream;
  }

  Stream<bool> get isLoading {
    return _loadingController.stream;
  }

  Future<void> increment() {
    _loadingController.sink.add(true);
    return Future.delayed(const Duration(seconds: 1)).then((_) {
      _countController.sink.add(_count++);
    }).whenComplete(() {
      _loadingController.sink.add(false);
    });
  }

  void dispose() {
    _countController.close();
    _loadingController.close();
  }
}
