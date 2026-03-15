import 'package:flutter/material.dart';

void main() {
  runApp(const Praktikum2());
}

class Praktikum2 extends StatelessWidget {
  const Praktikum2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController pesanController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('images/amikom.png', width: 40, height: 40),
            SizedBox(width: 10),
            Text(
              "Praktikum 2 - Informatika",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: const Color.fromARGB(255, 45, 66, 251),
              ),
            ),
          ],
        ),
      ),
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
              padding: EdgeInsets.only(left: 20, top: 4, right: 20, bottom: 4),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 45, 66, 251),
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
                  fontSize: 24.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              "Pengenalan Flutter dan Dart",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 45, 66, 251),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8, bottom: 16),
              child: TextField(
                controller: pesanController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Masukan Nama Mata Kuliah Anda",
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      width: 1.7,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 45, 66, 251),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 45, 66, 251),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(pesanController.text)),
                    );
                  },
                  icon: Icon(Icons.send),
                  label: Text('Kirim'),
                ),
                SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.info),
                  label: Text('Informasi'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 255, 123, 0),
                    side: BorderSide(
                      color: const Color.fromARGB(255, 255, 123, 0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
