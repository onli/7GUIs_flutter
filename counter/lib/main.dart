import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // Instantiate your class using Get.put() to make it available for all "child" routes there.
  final Controller c = Get.put(Controller());

  @override
  Widget build(context) => Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(title: Text('Counter')),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Obx(() => Text("Clicks: ${c.count}")),
          RaisedButton(child: Text("Count"), onPressed: () => c.increment()),
        ],
      )));
}

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}
