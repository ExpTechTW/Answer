import 'package:answer/UI/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:loggy/loggy.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Loggy.initLoggy(
    logPrinter: StreamPrinter(
      const PrettyDeveloperPrinter(),
    ),
    logOptions: const LogOptions(
      LogLevel.all,
      stackTraceLevel: LogLevel.error,
    ),
  );
  runApp(const Answer());
}

class Answer extends StatelessWidget {
  const Answer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
