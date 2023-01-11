import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/pages/choose_topic_page.dart';
import 'package:test_flutter/pages/reminders_page.dart';
import 'package:test_flutter/pages/started_page.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RemindersPage(),
    );
  }
}

