import 'package:flutter/material.dart';
import 'package:praktikum_7_pmo_igo_responsi/main.dart';
import 'package:praktikum_7_pmo_igo_responsi/cart.dart';
import 'package:praktikum_7_pmo_igo_responsi/profile.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  const AppBottomNav({super.key, required this.currentIndex});

  void _onTap(BuildContext context, int index) {
    if (index == currentIndex) return;
    Widget page;
    switch (index) {
      case 0:
        page = const HomePage();
        break;
      case 1:
        page = const CartPage();
        break;
      case 2:
        page = const ProfilePage();
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
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "Profile"),
      ],
    );
  }
}
