import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:praktikum_6_pmo_igo/agama.dart';
import 'package:praktikum_6_pmo_igo/dataPendaftaran.dart';
import 'package:praktikum_6_pmo_igo/jamDaftar.dart';
import 'package:praktikum_6_pmo_igo/kemampuanBerbahasa.dart';
import 'package:praktikum_6_pmo_igo/model.dart';
import 'package:praktikum_6_pmo_igo/tanggalDaftar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 132, 41, 134),
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              const Color.fromARGB(255, 132, 41, 134),
            ),
            foregroundColor: MaterialStatePropertyAll(Colors.white),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();

  String? jenisKelamin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 132, 41, 134),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logo_amikom_white.png',
              width: 40,
              height: 40,
            ),
            SizedBox(width: 10),
            Text(
              "Praktikum 6 - Informatika",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 35,
              right: 23,
              bottom: 0,
              left: 23,
            ),
            color: const Color.fromARGB(230, 132, 41, 134),
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 3,
                    ),
                    margin: const EdgeInsets.only(bottom: 13),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 251, 255, 0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: const Text(
                      'Igo Tegar Prambudhy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10.3,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Text(
                    "Selamat Datang Di Pemrograman Mobile",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    "Form Data di Flutter",
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
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 25,
              right: 23,
              bottom: 35,
              left: 23,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: namaController,
                  decoration: const InputDecoration(
                    label: Text("Nama Lengkap"),
                  ),
                ),
                const SizedBox(height: 3.5),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(label: Text("Email")),
                ),
                const SizedBox(height: 3.5),
                TextField(
                  controller: noTelpController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    label: Text("Nomor Telepon"),
                  ),
                ),
                const SizedBox(height: 13),
                const Text("Jenis Kelamin"),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text("Pria"),
                        value: "Pria",
                        groupValue: jenisKelamin,
                        onChanged: (value) =>
                            setState(() => jenisKelamin = value),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: const Text("Wanita"),
                        value: "Wanita",
                        groupValue: jenisKelamin,
                        onChanged: (value) =>
                            setState(() => jenisKelamin = value),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3.5),
                KemampuanBerbahasa(),
                const SizedBox(height: 3.5),
                Agama(),
                const SizedBox(height: 3.5),
                TanggalDaftar(),
                const SizedBox(height: 3.5),
                JamDaftar(),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            Pendaftaran pendaftaran = Pendaftaran(
                              context,
                              namaController.text,
                              emailController.text,
                              noTelpController.text,
                              jenisKelamin.toString(),
                              bahasaDipilihList.toString(),
                              agamaDipilih.toString(),
                              tanggalDaftarController.text,
                              jamDaftarController.text,
                            );

                            if (pendaftaran.sudahValid()) {
                              pendaftaranList.add(pendaftaran);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DataPendaftaran(),
                                ),
                              );
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          enabledMouseCursor: SystemMouseCursors.click,
                        ),
                        icon: const Icon(Icons.save),
                        label: const Text("Save Data"),
                      ),
                      const SizedBox(width: 15),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DataPendaftaran(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          enabledMouseCursor: SystemMouseCursors.click,
                        ),
                        icon: const Icon(Icons.people),
                        label: const Text("Lihat Data"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
