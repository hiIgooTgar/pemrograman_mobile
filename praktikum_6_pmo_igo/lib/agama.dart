import 'package:flutter/material.dart';

String? agamaDipilih;

class Agama extends StatefulWidget {
  const Agama({super.key});

  @override
  State<Agama> createState() => _AgamaState();
}

class _AgamaState extends State<Agama> {
  List<String> agamaList = [
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
    return DropdownButton(
      hint: Text("Silahkan Plih Agama Yang Anda Anut"),
      value: agamaDipilih,
      items: agamaList
          .map((e) => DropdownMenuItem(child: Text(e), value: e))
          .toList(),
      onChanged: (value) {
        setState(() {
          agamaDipilih = value;
        });
      },
    );
  }
}
