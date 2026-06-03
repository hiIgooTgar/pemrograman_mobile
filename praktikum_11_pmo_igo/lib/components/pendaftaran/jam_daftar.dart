import 'package:flutter/material.dart';

class JamDaftar extends StatelessWidget {
  final TextEditingController controller;
  const JamDaftar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        label: const Text("Jam Daftar"),
        suffixIcon: IconButton(
          onPressed: () => _pilihJam(context),
          icon: const Icon(Icons.timer),
        ),
      ),
    );
  }

  Future<void> _pilihJam(BuildContext context) async {
    TimeOfDay? jamDidapat = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (jamDidapat != null) {
      final String hour = jamDidapat.hour.toString().padLeft(2, '0');
      final String minute = jamDidapat.minute.toString().padLeft(2, '0');
      controller.text = "$hour:$minute";
    }
  }
}
