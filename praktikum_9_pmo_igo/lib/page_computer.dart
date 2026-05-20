import 'package:flutter/material.dart';

class Computer extends StatefulWidget {
  const Computer({super.key});

  @override
  State<Computer> createState() => _ComputerState();
}

class _ComputerState extends State<Computer> {
  final TextEditingController _searchController = TextEditingController();

  String _searchQuery = "";
  String _selectedCategory = "ALL";

  final List<Map<String, String>> _computerProducts = [
    {
      "name": "Nvidia RTX 4070 Ti",
      "category": "Graphics Card",
      "price": "Rp 13.500.000",
      "image":
          "https://images.unsplash.com/photo-1591488320449-011701bb6704?w=500&q=80",
    },
    {
      "name": "AMD Ryzen 7 7800X3D",
      "category": "Processor",
      "price": "Rp 6.800.000",
      "image": "https://stock-checker.com/uploads/7800X3DBurningArticle.png",
    },
    {
      "name": "Corsair Vengeance RGB 32GB",
      "category": "RAM Memory",
      "price": "Rp 1.950.000",
      "image":
          "https://images.unsplash.com/photo-1562976540-1502c2145186?w=500&q=80",
    },
    {
      "name": "Samsung 990 Pro 1TB",
      "category": "SSD Storage",
      "price": "Rp 5.500.000",
      "image":
          "https://www.unitysystems.lk/wp-content/uploads/2025/02/990-1.png",
    },
    {
      "name": "ASUS ROG Strix X670E",
      "category": "Motherboard",
      "price": "Rp 5.400.000",
      "image":
          "https://dlcdnwebimgs.asus.com/files/media/365BCD7B-3226-41E1-9F57-A34D332944AB/v1/img/style/rgbheader.png",
    },
    {
      "name": "NZXT Kraken Elite 360",
      "category": "Liquid Cooler",
      "price": "Rp 3.200.000",
      "image":
          "https://cdn.salla.sa/KOPVE/Nl1DWbL3w4wYiuAEPm7OVPHFhfuRSvPS2r6ah3R4.png",
    },
  ];

  final List<String> _categories = [
    "ALL",
    "Graphics Card",
    "Processor",
    "RAM Memory",
    "SSD Storage",
    "Motherboard",
    "Liquid Cooler",
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredProducts = _computerProducts.where((
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
              "Computer Hardware",
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
                hintText: "Search Hardware...",
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
                          Icons.memory_outlined,
                          size: 60,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "No Hardware Found",
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
                                                "${product["name"]} ditambahkan ke keranjang!",
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
