import 'package:flutter/material.dart';

class ProfilBanner extends StatelessWidget {
  final bool isEditMode;

  const ProfilBanner({super.key, required this.isEditMode});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 35, right: 23, left: 23),
      color: const Color.fromARGB(230, 132, 41, 134),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 13),
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                image: const DecorationImage(
                  image: AssetImage("assets/images/amikom_1-1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              margin: const EdgeInsets.only(bottom: 13),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 251, 255, 0),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: const Text(
                'Igo Tegar Prambudhy',
                style: TextStyle(
                  fontSize: 10.3,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              isEditMode
                  ? "Edit Data Pendaftaran"
                  : "Selamat Datang Di Pemrograman Mobile",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 3),
            const Text(
              "CRUD Data dan RESTful API di Flutter",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19.5,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 251, 255, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
