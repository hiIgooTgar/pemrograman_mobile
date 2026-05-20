import 'package:flutter/material.dart';

class Headset extends StatefulWidget {
  const Headset({super.key});

  @override
  State<Headset> createState() => _HeadsetState();
}

class _HeadsetState extends State<Headset> {
  final TextEditingController _searchController = TextEditingController();

  String _searchQuery = "";
  String _selectedCategory = "ALL";

  final List<Map<String, String>> _headsetProducts = [
    {
      "name": "Sony WH-1000XM5",
      "category": "Wireless Headphone",
      "price": "Rp 4.599.000",
      "image":
          "https://www.rollingstone.com/wp-content/uploads/2025/05/sony-headphones-2.png?w=900&h=600&crop=1",
    },
    {
      "name": "Logitech G Pro X Superlight",
      "category": "Gaming Headset",
      "price": "Rp 2.299.000",
      "image":
          "https://gadgetsquad.id/wp-content/uploads/2019/07/Headset-Gaming-Logitech-G-PRO-X-Cocok-Untuk-Gamer-Esport-1.png",
    },
    {
      "name": "AirPods Max Matte Black",
      "category": "Premium Headphone",
      "price": "Rp 8.499.000",
      "image":
          "https://images.unsplash.com/photo-1613040809024-b4ef7ba99bc3?w=500&q=80",
    },
    {
      "name": "Razer BlackShark V2 Pro",
      "category": "Gaming Headset",
      "price": "Rp 1.850.000",
      "image":
          "https://images.unsplash.com/photo-1546435770-a3e426bf472b?w=500&q=80",
    },
    {
      "name": "Audio-Technica ATH-M50x",
      "category": "Studio Monitor",
      "price": "Rp 2.150.000",
      "image":
          "https://images.unsplash.com/photo-1583394838336-acd977736f90?w=500&q=80",
    },
    {
      "name": "SteelSeries Arctis Nova 7",
      "category": "Wireless Gaming",
      "price": "Rp 2.999.000",
      "image":
          "https://images.unsplash.com/photo-1628202926206-c63a34b1618f?w=500&q=80",
    },
  ];

  final List<String> _categories = [
    "ALL",
    "Wireless Headphone",
    "Gaming Headset",
    "Premium Headphone",
    "Studio Monitor",
    "Wireless Gaming",
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredProducts = _headsetProducts.where((
      product,
    ) {
      final nameMatches = product["name"]!.toLowerCase().contains(
        _searchQuery.toLowerCase(),
      );
      final categoryMatches =
          _selectedCategory == "ALL" ||
          product["category"] == _selectedCategory;
      return nameMatches && categoryMatches;
    }).toList();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
            child: Text(
              "Audio & Headset",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search Headset...",
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.grey),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                            _searchQuery = "";
                          });
                        },
                      )
                    : null,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 24.0,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(
                    color: Color(0xFFFFB200),
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
              ),
              itemBuilder: (context, index) {
                final category = _categories[index];
                final isSelected = _selectedCategory == category;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: isSelected,
                    selectedColor: Color(0xFFFFB200),
                    backgroundColor: Colors.grey[300],
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.black : Colors.black87,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    side: BorderSide(
                      color: isSelected
                          ? Color(0xFFFFB200)
                          : Colors.transparent,
                    ),
                    onSelected: (selected) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                  ),
                );
              },
            ),
          ),

          Expanded(
            child: filteredProducts.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.headphones_outlined,
                          size: 60,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "No Headset Found",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.73,
                          ),
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];

                        return Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(15),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(product["image"]!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product["category"]!.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber[900],
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      product["name"]!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      product["price"]!,
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 34,
                                      child: ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFFFFB200),
                                          foregroundColor: Colors.black,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          padding: EdgeInsets.zero,
                                        ),
                                        onPressed: () {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                "${product["name"]} dimasukkan ke keranjang!",
                                              ),
                                              duration: const Duration(
                                                seconds: 1,
                                              ),
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.shopping_cart_outlined,
                                          size: 16,
                                        ),
                                        label: const Text(
                                          "Buy",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
