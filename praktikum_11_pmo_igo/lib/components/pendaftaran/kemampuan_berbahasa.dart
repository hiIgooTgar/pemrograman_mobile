import 'package:flutter/material.dart';

class KemampuanBerbahasa extends StatelessWidget {
  final List<String> bahasaDipilihList;
  final ValueChanged<List<String>> onChanged;

  const KemampuanBerbahasa({
    super.key,
    required this.bahasaDipilihList,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    List<String> bahasaList = [
      "Indonesia",
      "Inggris",
      "Prancis",
      "Spanyol",
      "Russia",
      "Melayu",
      "Arab",
      "Sunda",
      "Jawa",
      "Madura",
      "Jepang",
      "Mandarin",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Kemampuan Berbahasa"),
        const SizedBox(height: 5),
        SizedBox(
          height: 125,
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3.5 / 1,
            ),
            children: bahasaList.map((e) {
              bool isChecked = bahasaDipilihList.contains(e);
              return Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      List<String> updatedList = List.from(bahasaDipilihList);
                      if (value == true) {
                        updatedList.add(e);
                      } else {
                        updatedList.remove(e);
                      }
                      onChanged(updatedList);
                    },
                  ),
                  Text(e),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
