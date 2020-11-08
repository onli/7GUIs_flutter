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
      title: 'Temperature Converter',
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
      appBar: AppBar(title: Text('Temperature Converter')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: 80,
                child: Obx(() => TextFormField(
                      // to force Obx reload when value changes
                      key: Key("C" + c.celsius.string),
                      keyboardType: TextInputType.number,
                      initialValue: c.celsius.value.toStringAsFixed(1),
                      onChanged: (value) =>
                          c.fahrenheit.value = c.ctof(double.tryParse(value)),
                    ))),
            Text("Celsius ="),
            SizedBox(
                width: 80,
                child: Obx(() => TextFormField(
                      key: Key("F" + c.fahrenheit.string),
                      keyboardType: TextInputType.number,
                      initialValue: c.fahrenheit.value.toStringAsFixed(1),
                      onChanged: (value) =>
                          c.celsius.value = c.ftoc(double.tryParse(value)),
                    ))),
            Text("Fahrenheit"),
          ],
        ),
      ));
}

class Controller extends GetxController {
  var celsius = 0.0.obs;
  var fahrenheit = 0.0.obs;

  double ctof(double c) {
    return c * (9 / 5) + 32;
  }

  double ftoc(double f) {
    return (f - 32) * (5 / 9);
  }
}
