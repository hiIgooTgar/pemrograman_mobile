import 'package:flutter/material.dart';
import 'package:praktikum_6_pmo_igo/navbar_nav.dart';
import 'package:praktikum_6_pmo_igo/model.dart';

class DataPendaftaran extends StatefulWidget {
  const DataPendaftaran({super.key});

  @override
  State<DataPendaftaran> createState() => _DataPendaftaranState();
}

class _DataPendaftaranState extends State<DataPendaftaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavbarNav(),

      body: pendaftaranList.isEmpty
          ? Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                margin: const EdgeInsets.all(23.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(230, 132, 41, 134),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.folder_open_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Data Pendaftaran Kosong!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color.fromARGB(
                          255,
                          132,
                          41,
                          134,
                        ),
                      ),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text("Kembali ke Form"),
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(23.0),
              itemCount: pendaftaranList.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextButton.icon(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 18,
                          color: Color.fromARGB(255, 132, 41, 134),
                        ),
                        label: const Text(
                          "Kembali ke Form",
                          style: TextStyle(
                            color: Color.fromARGB(255, 132, 41, 134),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }

                int dataIndex = index - 1;

                return Card(
                  margin: const EdgeInsets.only(bottom: 18),
                  color: const Color.fromARGB(230, 132, 41, 134),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(
                      color: Color.fromARGB(230, 132, 41, 134),
                      width: 1,
                    ),
                  ),
                  child: ListTile(
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.person,
                          size: 16.5,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4.5),
                        Text(
                          pendaftaranList[dataIndex].nama,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.email_outlined,
                              size: 12.5,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 2.0),
                            Text(
                              pendaftaranList[dataIndex].email,
                              style: const TextStyle(
                                fontSize: 13.8,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 2.5),
                            const Text(
                              "-",
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(width: 2.5),
                            const Icon(
                              Icons.info_outlined,
                              size: 11.5,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 2.0),
                            Text(
                              pendaftaranList[dataIndex].jenisKelamin,
                              style: const TextStyle(
                                fontSize: 13.8,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          pendaftaranList[dataIndex].noTelp,
                          style: const TextStyle(
                            fontSize: 13.8,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          pendaftaranList[dataIndex].agama,
                          style: const TextStyle(
                            fontSize: 13.8,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.book_outlined,
                              size: 12.5,
                              color: Colors.white,
                            ),
                            SizedBox(width: 2.0),
                            Text(
                              "Kemampuan Bahasa",
                              style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          pendaftaranList[dataIndex].bahasa,
                          style: const TextStyle(
                            fontSize: 13.8,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.calendar_month_outlined,
                              size: 12.5,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 2.0),
                            Text(
                              "${pendaftaranList[dataIndex].tanggalDaftar} ${pendaftaranList[dataIndex].jamDaftar}",
                              style: const TextStyle(
                                fontSize: 13.8,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        hapusData(dataIndex);
                      },
                      icon: const Icon(Icons.delete, color: Colors.white),
                    ),
                  ),
                );
              },
            ),
    );
  }

  void hapusData(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Hapus Data",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(230, 132, 41, 134),
          ),
        ),
        content: Text(
          "Apakah anda yakin akan hapus data ${pendaftaranList[index].nama} ?",
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                pendaftaranList.removeAt(index);
                Navigator.pop(context);
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text("Ya, hapus!"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Tidak"),
          ),
        ],
      ),
    );
  }
}
