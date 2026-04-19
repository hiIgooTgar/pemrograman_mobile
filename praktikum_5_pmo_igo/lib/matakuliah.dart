import 'package:flutter/material.dart';
import 'package:praktikum_5_pmo_igo/bottom_nav.dart';
import 'package:praktikum_5_pmo_igo/navbar_nav.dart';

class Matakuliah extends StatefulWidget {
  const Matakuliah({super.key});
  @override
  State<Matakuliah> createState() => _MatakuliahState();
}

class _MatakuliahState extends State<Matakuliah> {
  final List<Map<String, dynamic>> mataKuliahList = [
    {
      "nama": "Pemrograman Mobile",
      "dosen": "Dr. Raden Munandar, M.Kom., Ph.D.",
      "alamat_terbit": "Surabaya",
      "tahun_terbit": "2015",
      "modul": "https://kubuku.id/api/generic/showCover/BK83864",
    },
    {
      "nama": "Statistika Probabilitas",
      "dosen": "Dr. Eleanor Sastrawinata, M.Sc., D.Sc.",
      "alamat_terbit": "Bandung",
      "tahun_terbit": "2018",
      "modul":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4424Kx5NI7vGJ8Y5eTnCdJwe6kqhGpglmqw&s",
    },
    {
      "nama": "Kalkulus",
      "dosen": "Dr. Baskoro Yudhistira, M.Si., CISA.",
      "alamat_terbit": "Jakarta",
      "tahun_terbit": "2016",
      "modul":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTi-oyYUg_V5OF1CVR_pDmcw9eXyu6oNLzrbg&s",
    },
    {
      "nama": "Bahasa Inggris",
      "dosen": "Dr. Siti Humaira M.Sc., Ph.D.",
      "alamat_terbit": "Semarang",
      "tahun_terbit": "2017",
      "modul":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBt_uy1l7Mjtxb7F5A5vlenYlT2jVgvo4ITw&s",
    },
    {
      "nama": "Matematika Diskrit",
      "dosen": "Dr. Hendrikus Wijaya, M.Si., Ph.D.",
      "alamat_terbit": "Surabaya",
      "tahun_terbit": "2015",
      "modul":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPJwxFq0swNJdbgtMBdqIR0jYpBXYBrQ7KyA&s",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavbarNav(),
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
              children: mataKuliahList
                  .map(
                    (item) => ListTile(
                      leading: Container(
                        width: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(item['modul']),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      title: Text(item['nama']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['dosen']),
                          Text(item['alamat_terbit']),
                          Text(item['tahun_terbit']),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 3),
    );
  }
}
