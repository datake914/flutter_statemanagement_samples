import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stateful Widget Pattern')),
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
  int _count = 0;
  bool _isLoading = false;

  void _increment() async {
    setState(() {
      _isLoading = true;
    });
    Future.delayed(const Duration(seconds: 1)).then((_) {
      setState(() {
        _count++;
      });
    }).whenComplete(() {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('called HomePageState#build');
    return Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            WidgetA(_count),
            const WidgetB(),
            WidgetC(_increment)
          ],
        ),
        LoadingWidget(_isLoading)
      ],
    );
  }
}
