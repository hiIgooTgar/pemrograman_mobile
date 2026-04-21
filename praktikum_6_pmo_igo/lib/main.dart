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
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.teal),
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
      appBar: AppBar(title: Text("Latihan Formulir")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              controller: namaController,
              decoration: InputDecoration(label: Text("Nama Lengkap")),
            ),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(label: Text("Email")),
            ),
            TextField(
              controller: noTelpController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(label: Text("Nomor Telepon")),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: RadioListTile(
                    title: Text("Pria"),
                    value: "Pria",
                    groupValue: jenisKelamin,
                    onChanged: (value) {
                      setState(() {
                        jenisKelamin = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: Text("Wanita"),
                    value: "Wanita",
                    groupValue: jenisKelamin,
                    onChanged: (value) {
                      setState(() {
                        jenisKelamin = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            KemampuanBerbahasa(),
            Agama(),
            TanggalDaftar(),
            JamDaftar(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
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
                              builder: (context) => DataPendaftaran(),
                            ),
                          );
                        }
                      });
                    },
                    child: Text("Simpan"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DataPendaftaran(),
                        ),
                      );
                    },
                    child: Text("Lihat Data"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
