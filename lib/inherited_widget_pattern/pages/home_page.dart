import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inherited Widget Pattern')),
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

  static HomePageState of(BuildContext context, {bool listen = true}) {
    if (listen) {
      return (context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>())!
          .data;
    }
    return (context
            .getElementForInheritedWidgetOfExactType<MyInheritedWidget>()!
            .widget as MyInheritedWidget)
        .data;
  }
}

class HomePageState extends State<HomePage> {
  int count = 0;
  bool isLoading = false;

  void increment() {
    setState(() {
      isLoading = true;
    });
    Future.delayed(const Duration(seconds: 1)).then((_) {
      setState(() {
        count++;
      });
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('called HomePageState#build');
    return MyInheritedWidget(
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                WidgetA(),
                WidgetB(),
                WidgetC(),
              ],
            ),
            const LoadingWidget()
          ],
        ),
        data: this);
  }
}

class MyInheritedWidget extends InheritedWidget {
  const MyInheritedWidget({Key? key, required Widget child, required this.data})
      : super(key: key, child: child);

  final HomePageState data;

  @override
  bool updateShouldNotify(covariant MyInheritedWidget oldWidget) {
    return true;
  }
}
