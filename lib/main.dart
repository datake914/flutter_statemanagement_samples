import 'package:flutter/material.dart';

import './stateful_widget_pattern/pages/home_page.dart'
    as stateful_widget_pattern;
import './inherited_widget_pattern/pages/home_page.dart'
    as inherit_widget_pattern;
import './provider_pattern/pages/home_page.dart' as provider_pattern;
import './provider_state_notifier_pattern/pages/home_page.dart'
    as provider_state_notifier_pattern;
import './riverpod_pattern/pages/home_page.dart' as riverpod_pattern;
import './bloc_pattern/pages/home_page.dart' as bloc_pattern;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const stateful_widget_pattern.TopPage(),
          '/stateful-widget-pattern': (context) =>
              const stateful_widget_pattern.TopPage(),
          '/inherited-widget-pattern': (context) =>
              const inherit_widget_pattern.TopPage(),
          '/provider-pattern': (context) => const provider_pattern.TopPage(),
          '/provider-state-notifier-pattern': (context) =>
              const provider_state_notifier_pattern.TopPage(),
          '/riverpod-pattern': (context) => const riverpod_pattern.TopPage(),
          '/bloc-pattern': (context) => const bloc_pattern.TopPage()
        });
  }
}
