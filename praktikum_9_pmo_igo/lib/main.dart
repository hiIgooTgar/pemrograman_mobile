import 'package:flutter/material.dart';
import './page_computer.dart' as computer;
import './page_headset.dart' as headset;
import './page_radio.dart' as radio;
import './page_smartphone.dart' as smartphone;

void main(List<String> args) {
  runApp(new MaterialApp(title: "Tab Bar", home: new MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Daftar Elektonik"),
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(icon: Icon(Icons.headset), text: "Headset"),
            Tab(icon: Icon(Icons.computer), text: "Computer"),
            Tab(icon: Icon(Icons.radio), text: "Radio"),
            Tab(icon: Icon(Icons.smartphone), text: "Smartphone"),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          computer.Computer(),
          headset.Headset(),
          radio.Radio(),
          smartphone.Smartphone(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.amber,
        child: TabBar(
          controller: controller,
          tabs: [
            Tab(icon: Icon(Icons.headset)),
            Tab(icon: Icon(Icons.computer)),
            Tab(icon: Icon(Icons.radio)),
            Tab(icon: Icon(Icons.smartphone)),
          ],
        ),
      ),
    );
  }
}
