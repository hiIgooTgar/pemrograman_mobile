import 'package:flutter/material.dart';
import 'package:praktikum_3_pmo_igo/bottom_nav.dart';

class Matakuliah extends StatefulWidget {
  const Matakuliah({super.key});
  @override
  State<Matakuliah> createState() => _MatakuliahState();
}

class _MatakuliahState extends State<Matakuliah> {
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
            padding: EdgeInsets.only(top: 20, left: 35, bottom: 20, right: 35),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Pencarian Materi Mata Kuliah',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(7.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 132, 41, 134),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(7.5),
                ),
              ),
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
                        image: AssetImage("images/modul/pmo.jpg"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: const Text('Mobile Learning'),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dr. Raden Munandar, M.Kom., Ph.D.'),
                      Text('Surabaya'),
                      Text('2015'),
                    ],
                  ),
                ),
                ListTile(
                  leading: Container(
                    width: 80,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("images/modul/statistika.jpg"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: const Text('Pengantar Statistika'),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dr. Eleanor Sastrawinata, M.Sc., D.Sc.'),
                      Text('Bandung'),
                      Text('2018'),
                    ],
                  ),
                ),
                ListTile(
                  leading: Container(
                    width: 80,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("images/modul/kalkulus.jpg"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: const Text('Kalkulus'),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dr. Baskoro Yudhistira, M.Si., CISA.'),
                      Text('Jakarta'),
                      Text('2016'),
                    ],
                  ),
                ),
                ListTile(
                  leading: Container(
                    width: 80,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("images/modul/english.jpg"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: const Text('Bahasa Inggris'),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dr. Siti Humaira M.Sc., Ph.D.'),
                      Text('Semarang'),
                      Text('2017'),
                    ],
                  ),
                ),
                ListTile(
                  leading: Container(
                    width: 80,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("images/modul/mtk.webp"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: const Text('Matematika'),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dr. Hendrikus Wijaya, M.Si., Ph.D.'),
                      Text('Surabaya'),
                      Text('2015'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 3),
    );
  }
}
