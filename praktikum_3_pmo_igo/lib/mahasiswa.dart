import 'package:flutter/material.dart';
import 'package:praktikum_3_pmo_igo/bottom_nav.dart';

class Mahasiswa extends StatefulWidget {
  const Mahasiswa({super.key});
  @override
  State<Mahasiswa> createState() => _MahasiswaState();
}

class _MahasiswaState extends State<Mahasiswa> {
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
                hintText: 'Pencarian Data Mahasiswa',
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
                    height: 83,
                    width: 83,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("images/user/male.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: const Text('24SA11A159'),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Igo Tegar Prambudhy'),
                      Text('Purbalingga'),
                      Text('igostrong@gmail.com'),
                      Text('089374634366'),
                    ],
                  ),
                ),
                ListTile(
                  leading: Container(
                    height: 83,
                    width: 83,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("images/user/male.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: const Text('24SA11X001'),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Edward Theo'),
                      Text('Jakarta'),
                      Text('edwardtheo@gmail.com'),
                      Text('089374631175'),
                    ],
                  ),
                ),
                ListTile(
                  leading: Container(
                    height: 83,
                    width: 83,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("images/user/female.webp"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: const Text('24SA11X002'),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Rachel Wilona'),
                      Text('Bandung'),
                      Text('rachelwilona@gmail.com'),
                      Text('089371624366'),
                    ],
                  ),
                ),
                ListTile(
                  leading: Container(
                    height: 83,
                    width: 83,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("images/user/female.webp"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: const Text('24SA11X003'),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Putri Eka Ayu'),
                      Text('Banyumas'),
                      Text('putrieka@gmail.com'),
                      Text('089986134366'),
                    ],
                  ),
                ),
                ListTile(
                  leading: Container(
                    height: 83,
                    width: 83,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("images/user/male.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: const Text('24SA11X004'),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nelson Mahendra'),
                      Text('Surabaya'),
                      Text('nelsonmahendra@gmail.com'),
                      Text('089371261366'),
                    ],
                  ),
                ),
                ListTile(
                  leading: Container(
                    height: 83,
                    width: 83,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("images/user/male.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: const Text('24SA11X005'),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Lucky Saputra'),
                      Text('Cirebon'),
                      Text('luckysaputra@gmail.com'),
                      Text('089651234366'),
                    ],
                  ),
                ),
                ListTile(
                  leading: Container(
                    height: 83,
                    width: 83,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("images/user/female.webp"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: const Text('24SA11X006'),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Prisia Melani'),
                      Text('Semarang'),
                      Text('prisiamelani@gmail.com'),
                      Text('089374765431'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 2),
    );
  }
}
