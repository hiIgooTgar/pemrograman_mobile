import 'package:flutter/material.dart';
import './page_headset.dart' as headset;
import './page_computer.dart' as computer;
import './page_radio.dart' as radio;
import './page_smartphone.dart' as smartphone;

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF224973);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Electronic - Pemrograman Mobile - Tab Bar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
        ),
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  final double topIconSize = 23.0;
  final double bottomIconSize = 23.0;
  final double bottomFontSize = 12.0;

  final Color primaryColor = const Color(0xFF224973);
  final Color activeColor = const Color(0xFFFFB200);
  final Color inactiveColor = Colors.white;

  final List<Map<String, dynamic>> tabItems = [
    {"icon": Icons.headset, "text": "Headset"},
    {"icon": Icons.computer, "text": "Computer"},
    {"icon": Icons.radio, "text": "Radio"},
    {"icon": Icons.smartphone, "text": "Smartphone"},
  ];

  @override
  void initState() {
    controller = TabController(length: tabItems.length, vsync: this);
    controller.addListener(() {
      if (!controller.indexIsChanging) {
        setState(() {});
      }
    });
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
        backgroundColor: primaryColor,
        elevation: 2,
        title: const Text(
          "My Electronic",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        bottom: TabBar(
          controller: controller,
          indicatorColor: activeColor,
          indicatorWeight: 3,
          tabs: tabItems.map((item) {
            final int tabIndex = tabItems.indexOf(item);
            final bool isSelected = controller.index == tabIndex;
            return Tab(
              icon: IconTheme(
                data: IconThemeData(
                  size: topIconSize,
                  color: isSelected ? activeColor : inactiveColor,
                ),
                child: Icon(item["icon"]),
              ),
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          headset.Headset(),
          computer.Computer(),
          radio.Radio(),
          smartphone.Smartphone(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Color.fromARGB(50, 34, 73, 115), width: 1.7),
          ),
        ),
        child: Material(
          color: Colors.white,
          elevation: 8,
          child: SafeArea(
            child: TabBar(
              controller: controller,
              indicatorColor: Colors.transparent,
              labelStyle: TextStyle(
                fontSize: bottomFontSize,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: bottomFontSize,
                fontWeight: FontWeight.normal,
                color: const Color(0xFF777777),
              ),
              tabs: tabItems.map((item) {
                final int tabIndex = tabItems.indexOf(item);
                final bool isSelected = controller.index == tabIndex;
                return Tab(
                  iconMargin: const EdgeInsets.only(bottom: 4),
                  icon: IconTheme(
                    data: IconThemeData(
                      size: bottomIconSize,
                      color: isSelected
                          ? primaryColor
                          : const Color(0xFF777777),
                    ),
                    child: Icon(item["icon"]),
                  ),
                  text: item["text"],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
