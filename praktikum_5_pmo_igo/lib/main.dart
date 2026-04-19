import 'package:flutter/material.dart';
import 'package:praktikum_5_pmo_igo/bottom_nav.dart';
import 'package:praktikum_5_pmo_igo/navbar_nav.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavbarNav(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/hero-img.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.58),
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                image: DecorationImage(
                  image: AssetImage("images/amikom_1-1.jpg"),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 4, right: 20, bottom: 4),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 132, 41, 134),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Text(
                'Igo Tegar Prambudhy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.3,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8, bottom: 3),
              child: Text(
                "Selamat Datang Di Pemrograman Mobile",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 13),
              child: Text(
                "Collection, Mapping Collection dan Extract Widget",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23.5,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 251, 255, 0),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 132, 41, 134),
                    foregroundColor: Colors.white,
                  ),
                  icon: Icon(Icons.business_outlined),
                  label: Text('Tentang'),
                ),
                SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.info),
                  label: Text('Informasi'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 251, 255, 0),
                    side: BorderSide(
                      color: const Color.fromARGB(255, 251, 255, 0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
    );
  }
}
