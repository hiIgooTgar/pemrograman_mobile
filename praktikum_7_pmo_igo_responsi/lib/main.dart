import 'package:flutter/material.dart';
import 'cart.dart';
import 'package:praktikum_7_pmo_igo_responsi/template/bottom_navigation.dart';

void main() {
  runApp(
    const MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color primaryGreen = const Color.fromARGB(255, 0, 122, 51);
  String selectedCategory = "Semua";
  String searchQuery = "";

  // Data Master Menu
  final List<Map<String, dynamic>> allMenus = [
    {
      "nama": "Nasi Goreng Spesial",
      "kategori": "Makanan",
      "harga": 25000,
      "image": "https://cdn-icons-png.flaticon.com/512/3449/3449383.png",
      "rating": 4.8,
      "waktu": "15 menit",
    },
    {
      "nama": "Es Teh Manis",
      "kategori": "Minuman",
      "harga": 5000,
      "image": "https://cdn-icons-png.flaticon.com/512/2830/2830214.png",
      "rating": 4.5,
      "waktu": "5 menit",
    },
    {
      "nama": "Burger King",
      "kategori": "Makanan",
      "harga": 45000,
      "image": "https://cdn-icons-png.flaticon.com/512/3075/3075977.png",
      "rating": 4.7,
      "waktu": "10 menit",
    },
    {
      "nama": "Jus Alpukat",
      "kategori": "Minuman",
      "harga": 15000,
      "image": "https://cdn-icons-png.flaticon.com/512/1728/1728739.png",
      "rating": 4.9,
      "waktu": "8 menit",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Logika Filter: Berdasarkan Kategori DAN Pencarian
    List<Map<String, dynamic>> displayedMenus = allMenus.where((menu) {
      bool matchCategory =
          selectedCategory == "Semua" || menu['kategori'] == selectedCategory;
      bool matchSearch = menu['nama'].toLowerCase().contains(
        searchQuery.toLowerCase(),
      );
      return matchCategory && matchSearch;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFFDF7F2),
      appBar: AppBar(
        title: const Text(
          "Kik1 Food",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.orange,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Promo Banner
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Promo Hari Ini 🔥",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Dapatkan potongan spesial untuk menu favoritmu!",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.fastfood, size: 50, color: Colors.white),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Search Bar
              TextField(
                onChanged: (value) => setState(() => searchQuery = value),
                decoration: InputDecoration(
                  hintText: "Cari makanan favoritmu...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Kategori
              const Text(
                "Kategori",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Row(
                children: ["Semua", "Makanan", "Minuman"].map((cat) {
                  bool isSelected = selectedCategory == cat;
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ChoiceChip(
                      label: Text(cat),
                      selected: isSelected,
                      selectedColor: Colors.orangeAccent,
                      onSelected: (val) =>
                          setState(() => selectedCategory = cat),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),

              // Menu List
              Text(
                "Menu Pilihan (${displayedMenus.length})",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              ...displayedMenus.map((item) => _buildMenuCard(item)).toList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
    );
  }

  Widget _buildMenuCard(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              item['image'],
              height: 150,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          ListTile(
            title: Text(
              item['nama'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Rp ${item['harga']}"),
            trailing: ElevatedButton.icon(
              onPressed: () {
                // KIRIM DATA KE CART PAGE
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(addedItem: item),
                  ),
                );
              },
              icon: const Icon(Icons.add_shopping_cart, size: 18),
              label: const Text("Tambah"),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryGreen,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
