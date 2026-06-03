import 'package:flutter/material.dart';
import 'package:praktikum_11_pmo_igo/pages/data_pendaftaran.dart';

class FormTombolAksi extends StatelessWidget {
  final bool isEditMode;
  final VoidCallback onSimpanAtauUpdate;
  final VoidCallback onReset;

  const FormTombolAksi({
    super.key,
    required this.isEditMode,
    required this.onSimpanAtauUpdate,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      child: Center(
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: onSimpanAtauUpdate,
              icon: Icon(isEditMode ? Icons.edit : Icons.save),
              label: Text(isEditMode ? "Ubah Data" : "Simpan Data"),
            ),
            ElevatedButton.icon(
              onPressed: onReset,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[700],
              ),
              icon: const Icon(Icons.refresh),
              label: const Text("Reset"),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DataPendaftaran(),
                  ),
                );
              },
              icon: const Icon(Icons.people),
              label: const Text("Lihat Data"),
            ),
          ],
        ),
      ),
    );
  }
}
