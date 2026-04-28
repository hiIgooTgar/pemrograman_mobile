import 'package:flutter/material.dart';
import 'package:praktikum_7_pmo_igo_responsi/template/bottom_navigation.dart';

class CartPage extends StatefulWidget {
  final Map<String, dynamic>? addedItem; // Menampung item yang baru ditambahkan

  const CartPage({super.key, this.addedItem});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final Color primaryGreen = const Color.fromARGB(255, 0, 122, 51);

  // Data keranjang belanja
  List<Map<String, dynamic>> cartItems = [
    {
      "nama": "Pizza Mozzarella",
      "kategori": "Makanan",
      "harga": 85000,
      "image": "https://cdn-icons-png.flaticon.com/512/3595/3595455.png",
      "qty": 1,
    },
  ];

  @override
  void initState() {
    super.initState();
    // Jika ada item baru dikirim dari Home, tambahkan ke list
    if (widget.addedItem != null) {
      cartItems.add({...widget.addedItem!, "qty": 1});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Keranjang Saya',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  leading: Image.network(item['image'], width: 50),
                  title: Text(
                    item['nama'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(item['kategori']),
                  trailing: Text(
                    "Rp ${item['harga']}",
                    style: TextStyle(
                      color: primaryGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryGreen,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Checkout Sekarang",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 1),
    );
  }
}
