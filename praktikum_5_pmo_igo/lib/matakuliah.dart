import 'package:flutter/material.dart';
import 'package:praktikum_5_pmo_igo/bottom_nav.dart';

class Matakuliah extends StatefulWidget {
  const Matakuliah({super.key});
  @override
  State<Matakuliah> createState() => _MatakuliahState();
}

class _MatakuliahState extends State<Matakuliah> {
  final List<Map<String, dynamic>> mataKuliahList = [
    {
      "nama": "Mobile Learning",
      "dosen": "Dr. Raden Munandar, M.Kom., Ph.D.",
      "alamat_terbit": "Surabaya",
      "tahun_terbit": "2015",
      "modul":
          "data:image/jpeg;base64,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",
    },
    {
      "nama": "Statistika Probabilitas",
      "dosen": "Dr. Eleanor Sastrawinata, M.Sc., D.Sc.",
      "alamat_terbit": "Bandung",
      "tahun_terbit": "2018",
      "modul":
          "https://storage.googleapis.com/cms-storage-bucket/a9d6ce81aee44ae017ee.png",
    },
    {
      "nama": "Kalkulus",
      "dosen": "Dr. Baskoro Yudhistira, M.Si., CISA.",
      "alamat_terbit": "Jakarta",
      "tahun_terbit": "2016",
      "modul":
          "https://prili.primakara.ac.id/uploads/books/thumbnails/1567.jpg",
    },
    {
      "nama": "Bahasa Inggris",
      "dosen": "Dr. Siti Humaira M.Sc., Ph.D.",
      "alamat_terbit": "Semarang",
      "tahun_terbit": "2017",
      "modul":
          "https://pustaka.ut.ac.id/lib/wp-content/uploads/2025/10/MKWI420102-1.webp",
    },
    {
      "nama": "Matematika Diskrit",
      "dosen": "Dr. Hendrikus Wijaya, M.Si., Ph.D.",
      "alamat_terbit": "Surabaya",
      "tahun_terbit": "2015",
      "modul": "https://cdn.gramedia.com/uploads/items/9786026232137.jpg",
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
