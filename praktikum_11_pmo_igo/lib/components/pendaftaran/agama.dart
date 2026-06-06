import 'package:flutter/material.dart';

class Agama extends StatelessWidget {
  final String? agamaDipilih;
  final ValueChanged<String?> onChanged;

  const Agama({super.key, required this.agamaDipilih, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final List<String> agamaList = [
      "Islam",
      "Kristen",
      "Katholik",
      "Hindu",
      "Buddha",
      "Konghucu",
      "Penganut Kepercayaan",
    ];

    return SizedBox(
      width: double.infinity,
      child: DropdownButton<String>(
        isExpanded: true,
        underline: Container(height: 1, color: Colors.grey),
        icon: const Icon(
          Icons.arrow_drop_down_circle,
          color: Color(0xFF0B2F9F),
        ),
        hint: const Text("Pilih Agama Anda"),
        value: agamaDipilih,
        items: agamaList.map((String e) {
          return DropdownMenuItem<String>(value: e, child: Text(e));
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
