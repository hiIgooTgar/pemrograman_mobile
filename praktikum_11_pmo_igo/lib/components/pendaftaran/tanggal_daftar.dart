import 'package:flutter/material.dart';

class TanggalDaftar extends StatelessWidget {
  final TextEditingController controller;
  const TanggalDaftar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        label: const Text("Tanggal Daftar"),
        suffixIcon: IconButton(
          onPressed: () => _pilihTanggal(context),
          icon: const Icon(Icons.date_range),
        ),
      ),
    );
  }

  Future<void> _pilihTanggal(BuildContext context) async {
    DateTime? tglDidapat = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );

    if (tglDidapat != null) {
      controller.text = tglDidapat.toString().substring(0, 10);
    }
  }
}
