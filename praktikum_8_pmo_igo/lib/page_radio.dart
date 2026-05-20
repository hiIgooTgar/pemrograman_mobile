import 'package:flutter/material.dart';

class Radio extends StatefulWidget {
  const Radio({super.key});

  @override
  State<Radio> createState() => _RadioState();
}

class _RadioState extends State<Radio> {
  final TextEditingController _searchController = TextEditingController();

  String _searchQuery = "";
  String _selectedCategory = "ALL";

  final List<Map<String, String>> _radioProducts = [
    {
      "name": "Panasonic RF-2400D",
      "category": "Portable Radio",
      "price": "Rp 375.000",
      "image": "https://i.ebayimg.com/images/g/7oEAAOSwTDJoT-LQ/s-l1200.png",
    },
    {
      "name": "Sony ICF-C1 Alarm",
      "category": "Clock Radio",
      "price": "Rp 499.000",
      "image":
          "https://photos-eu.bazaarvoice.com/photo/2/cGhvdG86c29ueS1nbG9iYWw/9b0e65d9-1777-5082-9226-6ed838241f7d",
    },
    {
      "name": "Tivoli Audio One BT",
      "category": "Classic Bluetooth Radio",
      "price": "Rp 3.850.000",
      "image":
          "https://images.squarespace-cdn.com/content/v1/5387c6c8e4b058cfb90dabb1/1506281695054-9JGMNP2R07WO1QALSDCI/P1010273.jpg",
    },
    {
      "name": "Sangean WR-11 Retro",
      "category": "Vintage Tabletop",
      "price": "Rp 1.450.000",
      "image":
          "https://capitalaudio.com/cdn/shop/files/ChatGPTImageMay27_2025_10_44_19AM.png?v=1748358008",
    },
    {
      "name": "JBL Tuner 2 FM",
      "category": "Digital Portable Radio",
      "price": "Rp 1.599.000",
      "image":
          "https://images.bauerhosting.com/affiliates/sites/8/2024/07/JBL-Tuner-2-1-HERO-IMAGE.jpg?ar=16%3A9&fit=crop&crop=top&auto=format&w=undefined&q=80",
    },
    {
      "name": "Philips TARV2500 Wood",
      "category": "Wooden Retro Radio",
      "price": "Rp 620.000",
      "image":
          "https://images.philips.com/is/image/philipsconsumer/d7b1b9c255ec469ebbf4b0bf00dd1a55",
    },
  ];

  final List<String> _categories = [
    "ALL",
    "Portable Radio",
    "Clock Radio",
    "Classic Bluetooth Radio",
    "Vintage Tabletop",
    "Digital Portable Radio",
    "Wooden Retro Radio",
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredProducts = _radioProducts.where((
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
              "Radio & Audio Player",
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
                hintText: "Search Radio...",
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
                          Icons.radio_outlined,
                          size: 60,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "No Radio Found",
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
