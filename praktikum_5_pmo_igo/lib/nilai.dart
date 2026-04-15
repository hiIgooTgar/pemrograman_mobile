import 'package:flutter/material.dart';
import 'package:praktikum_5_pmo_igo/bottom_nav.dart';

class Nilai extends StatefulWidget {
  const Nilai({super.key});
  @override
  State<Nilai> createState() => _NilaiState();
}

class _NilaiState extends State<Nilai> {
  final List<Map<String, dynamic>> nilaiList = [
    {
      "nama_matkul": "Mobile Learning",
      "dosen": "Dr. Raden Munandar, M.Kom., Ph.D.",
      "semester": "Semester 4",
      "sks": "3 SKS",
      "score":
          "https://www.laserninja.com/wp-content/uploads/2020/11/35614-impression.jpg",
    },
    {
      "nama_matkul": "Statistika Probabilitas",
      "dosen": "Dr. Eleanor Sastrawinata, M.Sc., D.Sc.",
      "semester": "Semester 4",
      "sks": "3 SKS",
      "score":
          "https://www.laserninja.com/wp-content/uploads/2020/11/35614-impression.jpg",
    },
    {
      "nama_matkul": "Kalkulus",
      "dosen": "Dr. Baskoro Yudhistira, M.Si., CISA.",
      "semester": "Semester 4",
      "sks": "3 SKS",
      "score":
          "https://www.laserninja.com/wp-content/uploads/2020/11/35614-impression.jpg",
    },
    {
      "nama_matkul": "Bahasa Inggris",
      "dosen": "Dr. Siti Humaira M.Sc., Ph.D.",
      "semester": "Semester 4",
      "sks": "3 SKS",
      "score":
          "https://www.laserninja.com/wp-content/uploads/2020/11/35614-impression.jpg",
    },
    {
      "nama_matkul": "Matematika Diskrit",
      "dosen": "Dr. Hendrikus Wijaya, M.Si., Ph.D.",
      "semester": "Semester 4",
      "sks": "3 SKS",
      "score":
          "https://www.laserninja.com/wp-content/uploads/2020/11/35614-impression.jpg",
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
              children: nilaiList
                  .map(
                    (item) => ListTile(
                      leading: Container(
                        width: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(item['score']),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      title: Text(item['nama_matkul']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['dosen']),
                          Text(item['semester']),
                          Text(item['sks']),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 4),
    );
  }
}
