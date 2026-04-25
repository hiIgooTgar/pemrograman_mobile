import 'package:flutter/material.dart';

String? agamaDipilih;

class Agama extends StatefulWidget {
  const Agama({super.key});
  @override
  State<Agama> createState() => _AgamaState();
}

class _AgamaState extends State<Agama> {
  final List<String> agamaList = [
    "Islam",
    "Kristen",
    "Katholik",
    "Hindu",
    "Buddha",
    "Konghucu",
    "Penganut Kepercayaan",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DropdownButton<String>(
        isExpanded: true,
        underline: Container(height: 1, color: Colors.grey),
        icon: const Icon(
          Icons.arrow_drop_down_circle,
          color: Color.fromARGB(255, 132, 41, 134),
        ),
        hint: const Text("Pilih Agama Anda"),
        value: agamaDipilih,
        items: agamaList.map((String e) {
          return DropdownMenuItem<String>(value: e, child: Text(e));
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            agamaDipilih = value;
          });
        },
      ),
    );
  }
}
