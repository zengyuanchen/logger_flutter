import 'package:flutter/material.dart';
import 'dart:async';

import 'package:logger/logger.dart';
import 'package:logger_flutter/logger_flutter.dart';

void main() {
  runApp(MyApp());
  log();
}

var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

void log() {
  logger.d("Log message with 2 methods");

  loggerNoStack.i("Info message");

  loggerNoStack.w("Just a warning!");

  logger.e("Error! Something bad happened", "Test Error");

  loggerNoStack.v({"key": 5, "value": "something"});

  Future.delayed(Duration(seconds: 5), log);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
            body: SafeArea(
          child: Container(
            child: Center(
              child: Column(
                children: [
                  TextButton(
                      onPressed: () {
                        LogConsole.open(context, dark: true);
                      },
                      child: Text('open')),
                  TextButton(
                      onPressed: () {
                        // Timer.periodic(Duration(seconds: 5), (timer) {
                        OutputEvent event =
                            OutputEvent(Level.debug, ['111111', '2222222']);
                        LogConsole.add(event);
                        // });
                      },
                      child: Text('add')),
                ],
              ),
            ),
          ),
        ));
      }),
    );
  }
}
