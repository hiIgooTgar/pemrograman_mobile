import 'package:flutter/material.dart';
import 'package:praktikum_11_pmo_igo/components/navbar_nav.dart';
import 'package:praktikum_11_pmo_igo/components/pendaftaran/agama.dart';
import 'package:praktikum_11_pmo_igo/components/pendaftaran/jam_daftar.dart';
import 'package:praktikum_11_pmo_igo/components/pendaftaran/kemampuan_berbahasa.dart';
import 'package:praktikum_11_pmo_igo/components/pendaftaran/tanggal_daftar.dart';
import 'package:praktikum_11_pmo_igo/components/pendaftaran/profil_banner.dart';
import 'package:praktikum_11_pmo_igo/components/pendaftaran/form_button.dart';
import 'package:praktikum_11_pmo_igo/config/model_pendaftaran.dart';
import 'package:praktikum_11_pmo_igo/controller/pendaftaran_controller.dart';
import 'package:praktikum_11_pmo_igo/pages/data_pendaftaran.dart';

class MyHomePage extends StatefulWidget {
  final Pendaftaran? dataUntukDiedit;
  const MyHomePage({super.key, this.dataUntukDiedit});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PendaftaranController _pendaftaranController = PendaftaranController();

  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noTelpController = TextEditingController();
  final TextEditingController tanggalDaftarController = TextEditingController();
  final TextEditingController jamDaftarController = TextEditingController();

  String? jenisKelamin;
  String? agamaDipilih;
  List<String> bahasaDipilihList = [];
  bool isEditMode = false;

  @override
  void initState() {
    super.initState();
    if (widget.dataUntukDiedit != null) {
      isEditMode = true;
      namaController.text = widget.dataUntukDiedit!.nama ?? '';
      emailController.text = widget.dataUntukDiedit!.email ?? '';
      noTelpController.text = widget.dataUntukDiedit!.noTelepon ?? '';
      jenisKelamin = widget.dataUntukDiedit!.jenisKelamin;
      tanggalDaftarController.text =
          widget.dataUntukDiedit!.tanggalDaftar ?? '';
      jamDaftarController.text = widget.dataUntukDiedit!.jamDaftar ?? '';
      agamaDipilih = widget.dataUntukDiedit!.agama;

      if (widget.dataUntukDiedit!.bahasa != null &&
          widget.dataUntukDiedit!.bahasa!.isNotEmpty) {
        String cleanString = widget.dataUntukDiedit!.bahasa!
            .replaceAll('[', '')
            .replaceAll(']', '');
        if (cleanString.isNotEmpty) {
          bahasaDipilihList = cleanString
              .split(',')
              .map((e) => e.trim())
              .toList();
        }
      }
    }
  }

  void resetForm() {
    setState(() {
      namaController.clear();
      emailController.clear();
      noTelpController.clear();
      tanggalDaftarController.clear();
      jamDaftarController.clear();
      jenisKelamin = null;
      agamaDipilih = null;
      bahasaDipilihList.clear();
      isEditMode = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Form berhasil dibersihkan!"),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void simpanAtauUpdateData() async {
    Pendaftaran pendaftaran = Pendaftaran(
      id: isEditMode ? widget.dataUntukDiedit!.id : null,
      nama: namaController.text,
      email: emailController.text,
      noTelepon: noTelpController.text,
      jenisKelamin: jenisKelamin ?? "",
      bahasa: bahasaDipilihList.toString(),
      agama: agamaDipilih ?? "",
      tanggalDaftar: tanggalDaftarController.text,
      jamDaftar: jamDaftarController.text,
    );

    if (pendaftaran.sudahValid(context)) {
      String? pesanErrorBackend;
      if (isEditMode) {
        pesanErrorBackend = await _pendaftaranController.updateData(
          pendaftaran.id!.toString(),
          pendaftaran,
        );
      } else {
        pesanErrorBackend = await _pendaftaranController.createData(
          pendaftaran,
        );
      }
      if (pesanErrorBackend == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              isEditMode
                  ? "Data Berhasil Diperbarui!"
                  : "Data Berhasil Disimpan!",
            ),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DataPendaftaran()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text("Aksi Gagal! $pesanErrorBackend"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavbarNav(),
      body: ListView(
        children: [
          ProfilBanner(isEditMode: isEditMode),
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
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(label: Text("Email")),
                ),
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
                      child: RadioListTile<String>(
                        title: const Text("Laki-Laki"),
                        value: "Laki-Laki",
                        groupValue: jenisKelamin,
                        onChanged: (value) =>
                            setState(() => jenisKelamin = value),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text("Perempuan"),
                        value: "Perempuan",
                        groupValue: jenisKelamin,
                        onChanged: (value) =>
                            setState(() => jenisKelamin = value),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3.5),
                KemampuanBerbahasa(
                  bahasaDipilihList: bahasaDipilihList,
                  onChanged: (newList) {
                    setState(() {
                      bahasaDipilihList = newList;
                    });
                  },
                ),
                const SizedBox(height: 3.5),
                Agama(
                  agamaDipilih: agamaDipilih,
                  onChanged: (value) {
                    setState(() {
                      agamaDipilih = value;
                    });
                  },
                ),
                const SizedBox(height: 3.5),
                TanggalDaftar(controller: tanggalDaftarController),
                const SizedBox(height: 3.5),
                JamDaftar(controller: jamDaftarController),
                FormTombolAksi(
                  isEditMode: isEditMode,
                  onSimpanAtauUpdate: simpanAtauUpdateData,
                  onReset: resetForm,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
