import 'package:flutter/material.dart';
import 'package:praktikum_5_pmo_igo/bottom_nav.dart';

class Mahasiswa extends StatefulWidget {
  const Mahasiswa({super.key});
  @override
  State<Mahasiswa> createState() => _MahasiswaState();
}

class _MahasiswaState extends State<Mahasiswa> {
  final List<Map<String, dynamic>> mahasiswaList = [
    {
      "nim": "24SA11A159",
      "nama": "Igo Tegar Prambudhy",
      "alamat": "Purbalingga",
      "email": "igostrong@gmail.com",
      "no_telp": "089374634366",
      "profile": "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
    },
    {
      "nim": "24SA11X001",
      "nama": "Edward Theo",
      "alamat": "Jakarta",
      "email": "edwardtheo@gmail.com",
      "no_telp": "089374631175",
      "profile": "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
    },
    {
      "nim": "24SA11X002",
      "nama": "Rachel Wilona",
      "alamat": "Bandung",
      "email": "rachelwilona@gmail.com",
      "no_telp": "089371624366",
      "profile": "https://cdn-icons-png.flaticon.com/512/3135/3135789.png",
    },
    {
      "nim": "24SA11X003",
      "nama": "Putri Eka Ayu",
      "alamat": "Banyumas",
      "email": "putrieka@gmail.com",
      "no_telp": "089986134366",
      "profile": "https://cdn-icons-png.flaticon.com/512/3135/3135789.png",
    },
    {
      "nim": "24SA11X004",
      "nama": "Nelson Mahendra",
      "alamat": "Surbaya",
      "email": "nelsonmahendra@gmail.com",
      "no_telp": "089371261366",
      "profile": "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
    },
    {
      "nim": "24SA11X005",
      "nama": "Lucky Saputra",
      "alamat": "Cirebon",
      "email": "luckysaputra@gmail.com",
      "no_telp": "089651234366",
      "profile": "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
    },
  ];

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
              children: mahasiswaList
                  .map(
                    (item) => ListTile(
                      leading: Container(
                        height: 83,
                        width: 83,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(item['profile']),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      title: Text(item['nim']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['nama']),
                          Text(item['alamat']),
                          Text(item['email']),
                          Text(item['no_telp']),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 2),
    );
  }
}
