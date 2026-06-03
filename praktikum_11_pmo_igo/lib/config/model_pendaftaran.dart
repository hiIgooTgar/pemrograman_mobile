import 'package:flutter/material.dart';

class Pendaftaran {
  String? id;
  String? nama;
  String? email;
  String? noTelepon;
  String? jenisKelamin;
  String? bahasa;
  String? agama;
  String? tanggalDaftar;
  String? jamDaftar;

  Pendaftaran({
    this.id,
    this.nama = "",
    this.email = "",
    this.noTelepon = "",
    this.jenisKelamin = "",
    this.bahasa = "",
    this.agama = "",
    this.tanggalDaftar = "",
    this.jamDaftar = "",
  });

  Pendaftaran.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    email = json['email'];
    noTelepon = json['no_telepon'];
    jenisKelamin = json['jenis_kelamin'];
    bahasa = json['bahasa'];
    agama = json['agama'];
    tanggalDaftar = json['tanggal_daftar'];
    jamDaftar = json['jam_daftar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['email'] = email;
    data['no_telepon'] = noTelepon;
    data['jenis_kelamin'] = jenisKelamin;
    data['bahasa'] = bahasa;
    data['agama'] = agama;
    data['tanggal_daftar'] = tanggalDaftar;
    data['jam_daftar'] = jamDaftar;
    return data;
  }

  bool sudahValid(BuildContext context) {
    if (nama == null || nama!.isEmpty) {
      tampilkanPesan(context, "Nama Wajib Diisi");
      return false;
    } else if (email == null || email!.isEmpty) {
      tampilkanPesan(context, "Email Wajib Diisi");
      return false;
    } else if (noTelepon == null || noTelepon!.isEmpty) {
      tampilkanPesan(context, "Nomor Telepon Wajib Diisi");
      return false;
    } else if (jenisKelamin == null ||
        jenisKelamin == "null" ||
        jenisKelamin!.isEmpty) {
      tampilkanPesan(context, "Silahkan Pilih Salah Satu Jenis Kelamin");
      return false;
    } else if (bahasa == null || bahasa == "[]" || bahasa!.isEmpty) {
      tampilkanPesan(context, "Wajib Memilih Minimal Satu Bahasa");
      return false;
    } else if (agama == null || agama == "null" || agama!.isEmpty) {
      tampilkanPesan(context, "Wajib Memilih Satu Agama");
      return false;
    } else if (tanggalDaftar == null || tanggalDaftar!.isEmpty) {
      tampilkanPesan(context, "Tanggal Daftar Wajib Diisi");
      return false;
    } else if (jamDaftar == null || jamDaftar!.isEmpty) {
      tampilkanPesan(context, "Jam Daftar Wajib Diisi");
      return false;
    }
    return true;
  }

  void tampilkanPesan(BuildContext context, String pesan) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(pesan)));
  }
}

List<Pendaftaran> pendaftaranList = [];
