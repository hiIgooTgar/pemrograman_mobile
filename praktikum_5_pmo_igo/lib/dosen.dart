import 'package:flutter/material.dart';
import 'package:praktikum_5_pmo_igo/bottom_nav.dart';

class Dosen extends StatefulWidget {
  const Dosen({super.key});
  @override
  State<Dosen> createState() => _DosenState();
}

class _DosenState extends State<Dosen> {
  final List<Map<String, dynamic>> dosenList = [
    {
      "nama": "Dr Wilson Regar M.Kom.",
      "email": "wilson.regar@amikom.ac.id",
      "profile":
          "https://images.pexels.com/photos/8197541/pexels-photo-8197541.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    },
    {
      "nama": "Dr. Sandra Purnomo M.Sc.",
      "email": "ken.edward@amikom.ac.id",
      "profile":
          "https://st3.depositphotos.com/1719616/19410/i/450/depositphotos_194104106-stock-photo-woman-teacher-posing-by-chalk.jpg",
    },
    {
      "nama": "Dr. Sarah De Johnson, M.T.",
      "email": "sarah.j@amikom.ac.id",
      "profile":
          "https://st4.depositphotos.com/16122460/31080/i/450/depositphotos_310801964-stock-photo-portrait-of-young-female-teacher.jpg",
    },
    {
      "nama": "Prof. Budi Santoso, M.Kom.",
      "email": "budi.s@amikom.ac.id",
      "profile":
          "https://static.vecteezy.com/system/resources/thumbnails/074/128/806/small/confident-caucasian-male-professor-smiling-in-lecture-hall-photo.jpg",
    },
    {
      "nama": "Dr. Ani Wijaya, Ph.D.",
      "email": "ani.w@amikom.ac.id",
      "profile":
          "https://universidadeuropea.com/resources/media/images/shutterstock_2421881563_1.width-640.jpg",
    },
    {
      "nama": "Dr. Ahmad Budiano, M.T.",
      "email": "ahmad.s@amikom.ac.id",
      "profile":
          "https://static.vecteezy.com/system/resources/thumbnails/048/764/535/small/confident-middle-aged-male-french-teacher-standing-in-classroom-educational-environment-academic-setting-photo.jpg",
    },
  ];

  String selectedName = "Pilih Dosen";
  String selectedEmail = "Email akan muncul di sini";
  String imageUrl = "";

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      image: imageUrl.isNotEmpty
                          ? DecorationImage(
                              image: NetworkImage(imageUrl),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: imageUrl.isEmpty
                        ? const Center(child: Text("Klik foto di bawah"))
                        : null,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text(
                          selectedName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          selectedEmail,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: dosenList.map((dosen) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedName = dosen['nama'];
                        selectedEmail = dosen['email'];
                        imageUrl = dosen['profile'];
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(dosen['profile']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 1),
    );
  }
}
