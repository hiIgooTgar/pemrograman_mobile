import 'package:flutter/material.dart';
import 'models/model_produk_list.dart';
import 'widgets/myappbar.dart';
import 'widgets/pencarian.dart';
import 'widgets/filter.dart';
import 'widgets/iklanutama.dart';
import 'widgets/listproduk.dart';
import 'widgets/my_navigation_bar.dart';
import 'screen/favorit_screen.dart';
import 'screen/pesanan_screen.dart';
import 'screen/profil_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App (NihonEat)',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Sans-Serif',
      ),
      home: const MainNavigationFrame(),
    );
  }
}

class MainNavigationFrame extends StatefulWidget {
  const MainNavigationFrame({super.key});

  @override
  State<MainNavigationFrame> createState() => _MainNavigationFrameState();
}

class _MainNavigationFrameState extends State<MainNavigationFrame> {
  int _screenIndex = 0;

  final List<Widget> _daftarHalaman = [
    const HomeScreen(),
    const FavoritScreen(),
    const PesananScreen(),
    const ProfilScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _daftarHalaman[_screenIndex],
      bottomNavigationBar: MyBottomNavBar(
        currentIndex: _screenIndex,
        onTap: (index) {
          setState(() {
            _screenIndex = index;
          });
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Pencarian(),
              const SizedBox(height: 20),
              const IklanUtama(),
              const SizedBox(height: 20),
              const Text(
                "Kategori Populer",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Filter(),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rekomendasi Spesial",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "Lihat Semua",
                    style: TextStyle(
                      color: Color(0xFF00809D),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ListProduk(dataProdukList: dataProdukUtama),
              const SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }
}
