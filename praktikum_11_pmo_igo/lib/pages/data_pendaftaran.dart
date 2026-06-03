import 'package:flutter/material.dart';
import 'package:praktikum_11_pmo_igo/components/navbar_nav.dart';
import 'package:praktikum_11_pmo_igo/config/model_pendaftaran.dart';
import 'package:praktikum_11_pmo_igo/controller/pendaftaran_controller.dart';
import 'package:praktikum_11_pmo_igo/pages/home_page.dart';

class DataPendaftaran extends StatefulWidget {
  const DataPendaftaran({super.key});

  @override
  State<DataPendaftaran> createState() => _DataPendaftaranState();
}

class _DataPendaftaranState extends State<DataPendaftaran> {
  final PendaftaranController _controller = PendaftaranController();
  List<Pendaftaran> pendaftaranList = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchDataPendaftaran();
  }

  Future<void> fetchDataPendaftaran() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      final data = await _controller.getAllData();
      setState(() {
        pendaftaranList = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString().replaceAll("Exception: ", "");
        isLoading = false;
      });
    }
  }

  Future<void> prosesHapusData(String id, int index) async {
    Navigator.pop(context);
    setState(() => isLoading = true);

    bool sukses = await _controller.deleteData(id);
    if (sukses) {
      setState(() {
        pendaftaranList.removeAt(index);
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data berhasil dihapus dari server!')),
      );
    } else {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal menghapus data dari server.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavbarNav(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 132, 41, 134),
                ),
              ),
            )
          : errorMessage.isNotEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(errorMessage, style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: fetchDataPendaftaran,
                    child: const Text("Coba Lagi"),
                  ),
                ],
              ),
            )
          : pendaftaranList.isEmpty
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
                      onPressed: () => Navigator.pop(context),
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
                final data = pendaftaranList[dataIndex];

                return Card(
                  margin: const EdgeInsets.only(bottom: 18),
                  color: const Color.fromARGB(230, 132, 41, 134),
                  child: ListTile(
                    title: Row(
                      children: [
                        const Icon(
                          Icons.person,
                          size: 16.5,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4.5),
                        Text(
                          data.nama ?? '-',
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
                        Text(
                          data.email ?? '-',
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          data.noTelepon ?? '-',
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          data.jenisKelamin ?? '-',
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          data.agama ?? '-',
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Bahasa: ${data.bahasa ?? '-'}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          "${data.tanggalDaftar ?? ''} ${data.jamDaftar ?? ''}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.white),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MyHomePage(dataUntukDiedit: data),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.white),
                          onPressed: () =>
                              dialogHapus(dataIndex, data.id, data.nama),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  void dialogHapus(int index, String? id, String? nama) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Hapus Data",
          style: TextStyle(color: Color.fromARGB(230, 132, 41, 134)),
        ),
        content: Text("Apakah anda yakin akan hapus data ${nama ?? ''} ?"),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (id != null) {
                prosesHapusData(id, index);
              } else {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('ID Data tidak ditemukan.')),
                );
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text("Ya, hapus!"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Tidak"),
          ),
        ],
      ),
    );
  }
}
