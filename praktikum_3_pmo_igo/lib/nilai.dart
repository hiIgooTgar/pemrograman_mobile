import 'package:flutter/material.dart';
import 'package:praktikum_3_pmo_igo/bottom_nav.dart';

class Nilai extends StatefulWidget {
  const Nilai({super.key});
  @override
  State<Nilai> createState() => _NilaiState();
}

class _NilaiState extends State<Nilai> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 132, 41, 134),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('images/logo_amikom_white.png', width: 40, height: 40),
            SizedBox(width: 10),
            Text(
              "Praktikum 3 - Informatika",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 132, 41, 134),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: const [
                        Text(
                          'Semester',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '4',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 132, 41, 134),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: const [
                        Text(
                          'IPK',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '3.80',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 132, 41, 134),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: const [
                        Text(
                          'SKS',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '63',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Container(
                    width: 80,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("images/score-modul.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: const Text('Mobile Learning'),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dr. Raden Munandar, M.Kom., Ph.D.'),
                      Text('Semester 4'),
                      Text('3 SKS'),
                    ],
                  ),
                ),
                ListTile(
                  leading: Container(
                    width: 80,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("images/score-modul.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: const Text('Pengantar Statistika'),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dr. Eleanor Sastrawinata, M.Sc., D.Sc.'),
                      Text('Semester 4'),
                      Text('3 SKS'),
                    ],
                  ),
                ),
                ListTile(
                  leading: Container(
                    width: 80,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("images/score-modul.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: const Text('Kalkulus'),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dr. Baskoro Yudhistira, M.Si., CISA.'),
                      Text('Semester 4'),
                      Text('3 SKS'),
                    ],
                  ),
                ),
                ListTile(
                  leading: Container(
                    width: 80,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("images/score-modul.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: const Text('Bahasa Inggris'),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dr. Siti Humaira M.Sc., Ph.D.'),
                      Text('Semester 4'),
                      Text('3 SKS'),
                    ],
                  ),
                ),
                ListTile(
                  leading: Container(
                    width: 80,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("images/score-modul.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: const Text('Matematika'),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dr. Hendrikus Wijaya, M.Si., Ph.D.'),
                      Text('Semester 4'),
                      Text('3 SKS'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 4),
    );
  }
}
