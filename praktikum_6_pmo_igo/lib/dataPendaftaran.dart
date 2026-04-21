import 'package:flutter/material.dart';
import 'package:praktikum_6_pmo_igo/model.dart';

class DataPendaftaran extends StatefulWidget {
  const DataPendaftaran({super.key});

  @override
  State<DataPendaftaran> createState() => _DataPendaftaranState();
}

class _DataPendaftaranState extends State<DataPendaftaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Data Pendaftaran",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(23.0),
        itemCount: pendaftaranList.length,
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.only(bottom: 18),
          color: const Color.fromARGB(97, 132, 41, 134),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(
              color: Color.fromARGB(100, 132, 41, 134),
              width: 1,
            ),
          ),
          child: ListTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.person, size: 16.5, color: Colors.white),
                SizedBox(width: 4.5),
                Text(
                  pendaftaranList[index].nama,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.email_outlined, size: 12.5, color: Colors.white),
                    SizedBox(width: 2.0),
                    Text(
                      pendaftaranList[index].email,
                      style: TextStyle(fontSize: 13.8, color: Colors.white),
                    ),
                    SizedBox(width: 2.5),
                    Text(
                      "-",
                      style: TextStyle(fontSize: 13.8, color: Colors.white),
                    ),
                    SizedBox(width: 2.5),
                    Icon(Icons.info_outlined, size: 11.5, color: Colors.white),
                    SizedBox(width: 2.0),
                    Text(
                      pendaftaranList[index].nama,
                      style: TextStyle(fontSize: 13.8, color: Colors.white),
                    ),
                  ],
                ),
                Text(
                  pendaftaranList[index].noTelp,
                  style: TextStyle(fontSize: 13.8, color: Colors.white),
                ),
                Text(
                  pendaftaranList[index].agama,
                  style: TextStyle(fontSize: 13.8, color: Colors.white),
                ),
                SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.book_outlined, size: 12.5, color: Colors.white),
                    SizedBox(width: 2.0),
                    Text(
                      "Kemampuan Bahasa",
                      style: TextStyle(fontSize: 13.0, color: Colors.white),
                    ),
                  ],
                ),
                Text(
                  pendaftaranList[index].bahasa,
                  style: TextStyle(fontSize: 13.8, color: Colors.white),
                ),
                SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      size: 12.5,
                      color: Colors.white,
                    ),
                    SizedBox(width: 2.0),
                    Text(
                      "${pendaftaranList[index].tanggalDaftar} ${pendaftaranList[index].jamDaftar}",
                      style: TextStyle(fontSize: 13.8, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            trailing: IconButton(
              onPressed: () {
                hapusData(index);
              },
              icon: Icon(Icons.delete, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  void hapusData(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Hapus Data",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(230, 132, 41, 134),
          ),
        ),
        content: Text(
          "Apakah anda yakin akan hapus data ${pendaftaranList[index].nama} ?",
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                pendaftaranList.removeAt(index);
                Navigator.pop(context);
              });
            },
            child: Text("Ya"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Tidak"),
          ),
        ],
      ),
    );
  }
}
