import 'package:flutter/material.dart';

TextEditingController tanggalDaftarController = TextEditingController();

class TanggalDaftar extends StatefulWidget {
  const TanggalDaftar({super.key});

  @override
  State<TanggalDaftar> createState() => _TanggalDaftarState();
}

class _TanggalDaftarState extends State<TanggalDaftar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: tanggalDaftarController,
      decoration: InputDecoration(
        label: Text("Tanggal Daftar"),
        suffixIcon: IconButton(
          onPressed: () {
            pilihTanggal();
          },
          icon: Icon(Icons.date_range),
        ),
      ),
    );
  }

  Future<void> pilihTanggal() async {
    DateTime? tglDidapat;

    tglDidapat = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );

    if (tglDidapat.toString() != "null") {
      tanggalDaftarController.text = tglDidapat.toString().substring(0, 10);
    }
  }
}
