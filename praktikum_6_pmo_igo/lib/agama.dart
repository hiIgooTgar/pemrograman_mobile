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
    return SizedBox(
      width: double.infinity,
      child: DropdownButton(
        isExpanded: true,
        icon: Icon(
          Icons.arrow_drop_down_circle,
          color: const Color.fromARGB(255, 132, 41, 134),
        ),
        hint: Text("Plih Agama Anda"),
        value: agamaDipilih,
        items: agamaList
            .map((e) => DropdownMenuItem(child: Text(e), value: e))
            .toList(),
        onChanged: (value) {
          setState(() {
            agamaDipilih = value;
          });
        },
      ),
    );
  }
}
