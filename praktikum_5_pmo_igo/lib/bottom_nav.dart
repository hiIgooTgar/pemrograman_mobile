import 'package:flutter/material.dart';
import 'package:praktikum_5_pmo_igo/main.dart';
import 'package:praktikum_5_pmo_igo/dosen.dart';
import 'package:praktikum_5_pmo_igo/mahasiswa.dart';
import 'package:praktikum_5_pmo_igo/matakuliah.dart';
import 'package:praktikum_5_pmo_igo/nilai.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  const AppBottomNav({super.key, required this.currentIndex});

  void _onTap(BuildContext context, int index) {
    if (index == currentIndex) return;
    Widget page;
    switch (index) {
      case 0:
        page = const MyApp();
        break;
      case 1:
        page = const Dosen();
        break;
      case 2:
        page = const Mahasiswa();
        break;
      case 3:
        page = const Matakuliah();
        break;
      case 4:
        page = const Nilai();
        break;
      default:
        return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _onTap(context, index),
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color.fromARGB(255, 132, 41, 134),
      selectedItemColor: const Color.fromARGB(255, 251, 255, 0),
      unselectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Dosen"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "Mahasiswa"),
        BottomNavigationBarItem(
          icon: Icon(Icons.collections_bookmark),
          label: "Mata Kuliah",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.score), label: "Nilai"),
      ],
    );
  }
}
