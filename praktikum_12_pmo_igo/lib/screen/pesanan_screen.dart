import 'package:flutter/material.dart';
import '../models/model_produk_list.dart';

class PesananScreen extends StatelessWidget {
  const PesananScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final produkPesanan = dataProdukUtama;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          title: const Text(
            "Pesanan Saya",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          bottom: const TabBar(
            labelColor: Color(0xFF0B2F9F),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xFF0B2F9F),
            indicatorWeight: 3,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            tabs: [
              Tab(text: "Dalam Proses"),
              Tab(text: "Selesai"),
              Tab(text: "Dibatalkan"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: produkPesanan.length,
              itemBuilder: (context, index) {
                final produk = produkPesanan[index];
                return CardPesanan(
                  nama: produk.namaProduk,
                  gambar: produk.gambar,
                  harga: produk.hargaNormal,
                  status: "Memasak Kuliner",
                  statusColor: const Color(0xFF00809D),
                  iconStatus: Icons.outdoor_grill_rounded,
                  tanggal: "Hari ini, 19:15 WIB",
                );
              },
            ),
            ListView(
              padding: const EdgeInsets.all(16),
              children: [
                CardPesanan(
                  nama: dataProdukUtama[0].namaProduk,
                  gambar: dataProdukUtama[0].gambar,
                  harga: dataProdukUtama[0].hargaNormal,
                  status: "Selesai Diterima",
                  statusColor: Colors.green,
                  iconStatus: Icons.check_circle_rounded,
                  tanggal: "Khamis, 18 Jun 2026",
                ),
              ],
            ),
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.assignment_late_outlined,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Tiada pesanan yang dibatalkan",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardPesanan extends StatelessWidget {
  final String nama;
  final String gambar;
  final String harga;
  final String status;
  final Color statusColor;
  final IconData iconStatus;
  final String tanggal;

  const CardPesanan({
    super.key,
    required this.nama,
    required this.gambar,
    required this.harga,
    required this.status,
    required this.statusColor,
    required this.iconStatus,
    required this.tanggal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    image: DecorationImage(
                      image: NetworkImage(gambar),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nama,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        tanggal,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "RM $harga",
                        style: const TextStyle(
                          color: Color(0xFF0B2F9F),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(color: Colors.grey[100], thickness: 1.5),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(iconStatus, color: statusColor, size: 18),
                    const SizedBox(width: 6),
                    Text(
                      status,
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xFF0B2F9F).withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Lacak",
                    style: TextStyle(
                      color: Color(0xFF0B2F9F),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
