import 'package:flutter/material.dart';

class Pendaftaran {
  BuildContext context;
  String nama = "";
  String email = "";
  String noTelp = "";
  String jenisKelamin = "";
  String bahasa = "";
  String agama = "";
  String tanggalDaftar = "";
  String jamDaftar = "";

  Pendaftaran(
    this.context,
    this.nama,
    this.email,
    this.noTelp,
    this.jenisKelamin,
    this.bahasa,
    this.agama,
    this.tanggalDaftar,
    this.jamDaftar,
  );

  bool sudahValid() {
    if (nama.isEmpty) {
      tampilkanPesan("Nama Wajib Diisi");
      return false;
    } else if (email.isEmpty) {
      tampilkanPesan("Email Wajib Diisi");
      return false;
    } else if (noTelp.isEmpty) {
      tampilkanPesan("Nomor Telepon Wajib Diisi");
      return false;
    } else if (jenisKelamin == "null") {
      tampilkanPesan("Silahkan Pilih Salah Satu Jenis Kelamin");
      return false;
    } else if (bahasa == "[]") {
      tampilkanPesan("Wajib Memilih Minimal Satu Bahasa");
      return false;
    } else if (agama == "null") {
      tampilkanPesan("Wajib Memilih Satu Agama");
      return false;
    } else if (tanggalDaftar.isEmpty) {
      tampilkanPesan("Tanggal Daftar Wajib Diisi");
      return false;
    } else if (jamDaftar.isEmpty) {
      tampilkanPesan("Jam Daftar Wajib Diisi");
      return false;
    }
    return true;
  }

  void tampilkanPesan(String pesan) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(pesan)));
  }
}

List<Pendaftaran> pendaftaranList = [];
