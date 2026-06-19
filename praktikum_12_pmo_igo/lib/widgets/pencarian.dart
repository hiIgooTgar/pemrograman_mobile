import 'package:flutter/material.dart';

class Pencarian extends StatefulWidget {
  const Pencarian({super.key});

  @override
  State<Pencarian> createState() => _PencarianState();
}

class _PencarianState extends State<Pencarian> {
  final TextEditingController controllerCari = TextEditingController();

  @override
  void dispose() {
    controllerCari.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: TextField(
          controller: controllerCari,
          onChanged: (value) => setState(() {}),
          decoration: InputDecoration(
            hintText: "Cari makanan atau produk favoritmu...",
            hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
            suffixIcon: controllerCari.text.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.close, color: Colors.grey[600], size: 20),
                    onPressed: () {
                      setState(() {
                        controllerCari.clear();
                      });
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
