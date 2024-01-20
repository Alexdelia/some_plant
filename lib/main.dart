import 'package:flutter/material.dart';
import 'package:some_plant/page/play.dart';

void main() {
  runApp(const SomePlant());
}

class SomePlant extends StatelessWidget {
  const SomePlant({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SomePlant',
        themeMode: ThemeMode.system,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const PlantPage());
  }
}


/*
import 'package:flutter/material.dart';
import 'package:some_plant/src/rust/api/simple.dart';
import 'package:some_plant/src/rust/frb_generated.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('flutter_rust_bridge quickstart')),
        body: Center(
          child: Text(
              'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`'),
        ),
      ),
    );
  }
}
*/
