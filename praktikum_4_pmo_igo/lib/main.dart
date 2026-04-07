import 'package:flutter/material.dart';
import 'package:praktikum_4_pmo_igo/rumus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  TextEditingController panjangPersegiPanjangController =
      TextEditingController();
  TextEditingController lebarPersegiPanjangController = TextEditingController();
  TextEditingController luasPersegiPanjangController = TextEditingController();
  TextEditingController kelilingPersegiPanjangController =
      TextEditingController();

  TextEditingController panjangBalokController = TextEditingController();
  TextEditingController lebarBalokController = TextEditingController();
  TextEditingController tinggiBalokController = TextEditingController();
  TextEditingController luasBalokController = TextEditingController();
  TextEditingController volumeBalokController = TextEditingController();

  TextEditingController jarijariLingkaranController = TextEditingController();
  TextEditingController diameterLingkaranController = TextEditingController();
  TextEditingController luasLingkaranController = TextEditingController();
  TextEditingController kelilingLingkaranController = TextEditingController();

  TextEditingController jarijariTabungController = TextEditingController();
  TextEditingController tinggiTabungController = TextEditingController();
  TextEditingController volumeTabungController = TextEditingController();
  TextEditingController luasSelimutTabungController = TextEditingController();
  TextEditingController luasPermukaanTabungController = TextEditingController();

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
              "Praktikum 4 - Informatika",
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
          Padding(
            padding: const EdgeInsets.only(
              top: 35,
              right: 23,
              bottom: 0,
              left: 23,
            ),
            child: Container(
              color: const Color.fromARGB(230, 132, 41, 134),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 13),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        image: DecorationImage(
                          image: AssetImage("assets/images/amikom_1-1.jpg"),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 20,
                        top: 3,
                        right: 20,
                        bottom: 3,
                      ),
                      margin: EdgeInsets.only(bottom: 13),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 251, 255, 0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Text(
                        'Igo Tegar Prambudhy',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10.3,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 3),
                      child: Text(
                        "Selamat Datang Di Pemrograman Mobile",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 13),
                      child: Text(
                        "Materi Object-Oriented Programming di Flutter",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 19.5,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 251, 255, 0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 35,
              right: 23,
              bottom: 0,
              left: 23,
            ),
            child: Container(
              color: const Color.fromARGB(63, 132, 41, 134),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Rumus Persegi Panjang",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight(500),
                      ),
                    ),
                    SizedBox(height: 14),
                    TextField(
                      controller: panjangPersegiPanjangController,
                      decoration: const InputDecoration(
                        label: Text("Panjang Persegi Panjang"),
                      ),
                    ),
                    TextField(
                      controller: lebarPersegiPanjangController,
                      decoration: const InputDecoration(
                        label: Text("Lebar Persegi Panjang"),
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            251,
                            255,
                            0,
                          ),
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            if (panjangPersegiPanjangController.text.isEmpty ||
                                lebarPersegiPanjangController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Panjang dan Lebar Persegi Panjang Harap Diisi!",
                                  ),
                                ),
                              );
                              return;
                            }

                            double panjang = double.parse(
                              panjangPersegiPanjangController.text,
                            );
                            double lebar = double.parse(
                              lebarPersegiPanjangController.text,
                            );
                            PersegiPanjang persegiPanjang = PersegiPanjang(
                              panjang,
                              lebar,
                            );
                            luasPersegiPanjangController.text = persegiPanjang
                                .getLuasPersegiPanjang()
                                .toString();
                            kelilingPersegiPanjangController.text =
                                persegiPanjang
                                    .getKelilingPersegiPanjang()
                                    .toString();
                          });
                        },
                        child: const Text("Hitung"),
                      ),
                    ),
                    TextField(
                      controller: luasPersegiPanjangController,
                      decoration: const InputDecoration(
                        label: Text("Luas Persegi Panjang"),
                      ),
                    ),
                    TextField(
                      controller: kelilingPersegiPanjangController,
                      decoration: const InputDecoration(
                        label: Text("Keliling Persegi Panjang"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 35,
              right: 23,
              bottom: 0,
              left: 23,
            ),
            child: Container(
              color: const Color.fromARGB(63, 132, 41, 134),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Rumus Balok",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight(500),
                      ),
                    ),
                    SizedBox(height: 14),
                    TextField(
                      controller: panjangBalokController,
                      decoration: const InputDecoration(
                        label: Text("Panjang Balok"),
                      ),
                    ),
                    TextField(
                      controller: lebarBalokController,
                      decoration: const InputDecoration(
                        label: Text("Lebar Balok"),
                      ),
                    ),
                    TextField(
                      controller: tinggiBalokController,
                      decoration: const InputDecoration(
                        label: Text("Tinggi Balok"),
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            251,
                            255,
                            0,
                          ),
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            if (panjangBalokController.text.isEmpty ||
                                lebarBalokController.text.isEmpty ||
                                tinggiBalokController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Panjang, Lebar, dan Tinggi Balok Harap Diisi!",
                                  ),
                                ),
                              );
                              return;
                            }

                            double panjang = double.parse(
                              panjangBalokController.text,
                            );
                            double lebar = double.parse(
                              lebarBalokController.text,
                            );
                            double tinggi = double.parse(
                              tinggiBalokController.text,
                            );
                            Balok balok = Balok(panjang, lebar, tinggi);
                            luasBalokController.text = balok
                                .getLuasBalok()
                                .toString();
                            volumeBalokController.text = balok
                                .getVolumeBalok()
                                .toString();
                          });
                        },
                        child: const Text("Hitung"),
                      ),
                    ),
                    TextField(
                      controller: volumeBalokController,
                      decoration: const InputDecoration(
                        label: Text("Volume Balok"),
                      ),
                    ),
                    TextField(
                      controller: luasBalokController,
                      decoration: const InputDecoration(
                        label: Text("Luas Balok"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 35,
              right: 23,
              bottom: 0,
              left: 23,
            ),
            child: Container(
              color: const Color.fromARGB(63, 132, 41, 134),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Rumus Lingkaran",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight(500),
                      ),
                    ),
                    SizedBox(height: 14),
                    TextField(
                      controller: jarijariLingkaranController,
                      decoration: const InputDecoration(
                        label: Text("Jari Jari Lingkaran"),
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            251,
                            255,
                            0,
                          ),
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            if (jarijariLingkaranController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Jari Jari Lingkaran Harap Diisi!",
                                  ),
                                ),
                              );
                              return;
                            }

                            double jariJari = double.parse(
                              jarijariLingkaranController.text,
                            );
                            Lingkaran lingkaran = Lingkaran(jariJari);
                            diameterLingkaranController.text = lingkaran
                                .getDiameterLingkaran()
                                .toString();
                            luasLingkaranController.text = lingkaran
                                .getLuasLingkaran()
                                .toString();
                            kelilingLingkaranController.text = lingkaran
                                .getKellingLingkaran()
                                .toString();
                          });
                        },
                        child: const Text("Hitung"),
                      ),
                    ),
                    TextField(
                      controller: diameterLingkaranController,
                      decoration: const InputDecoration(
                        label: Text("Diameter Lingkaran"),
                      ),
                    ),
                    TextField(
                      controller: luasLingkaranController,
                      decoration: const InputDecoration(
                        label: Text("Luas Lingkaran"),
                      ),
                    ),
                    TextField(
                      controller: kelilingLingkaranController,
                      decoration: const InputDecoration(
                        label: Text("Keliling Lingkaran"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 35,
              right: 23,
              bottom: 35,
              left: 23,
            ),
            child: Container(
              color: const Color.fromARGB(63, 132, 41, 134),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Rumus Tabung",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight(500),
                      ),
                    ),
                    SizedBox(height: 14),
                    TextField(
                      controller: jarijariTabungController,
                      decoration: const InputDecoration(
                        label: Text("Jari Jari Tabung"),
                      ),
                    ),
                    TextField(
                      controller: tinggiTabungController,
                      decoration: const InputDecoration(
                        label: Text("Tinggi Tabung"),
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            251,
                            255,
                            0,
                          ),
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            if (jarijariTabungController.text.isEmpty ||
                                tinggiTabungController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Jari Jari dan Tinggi Tabung Harap Diisi!",
                                  ),
                                ),
                              );
                              return;
                            }

                            double jariJari = double.parse(
                              jarijariTabungController.text,
                            );
                            double tinggi = double.parse(
                              tinggiTabungController.text,
                            );

                            Tabung tabung = Tabung(jariJari, tinggi);
                            volumeTabungController.text = tabung
                                .getVolumeTabung()
                                .toString();
                            luasSelimutTabungController.text = tabung
                                .getLuasSelimutTabung()
                                .toString();
                            luasPermukaanTabungController.text = tabung
                                .getLuasPermukaanTabung()
                                .toString();
                          });
                        },
                        child: const Text("Hitung"),
                      ),
                    ),

                    TextField(
                      controller: volumeTabungController,
                      decoration: const InputDecoration(
                        label: Text("Volume Tabung"),
                      ),
                    ),
                    TextField(
                      controller: luasSelimutTabungController,
                      decoration: const InputDecoration(
                        label: Text("Luas Selimut Tabung"),
                      ),
                    ),
                    TextField(
                      controller: luasPermukaanTabungController,
                      decoration: const InputDecoration(
                        label: Text("Luas Permukaan Tabung"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
