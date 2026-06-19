import 'package:flutter/material.dart';

final List<Map<String, dynamic>> dataFilter = [
  {"icon": Icons.all_inbox, "label": "Semua"},
  {"icon": Icons.favorite, "label": "Terlaris"},
  {"icon": Icons.discount, "label": "Diskon"},
  {"icon": Icons.new_releases, "label": "Terbaru"},
  {"icon": Icons.food_bank, "label": "Makanan"},
  {"icon": Icons.emoji_food_beverage, "label": "Minuman"},
  {"icon": Icons.ac_unit, "label": "Jajanan"},
  {"icon": Icons.money, "label": "COD"},
];

int posisiFilter = 0;

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dataFilter.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              posisiFilter = index;
            });
          },
          child: KotakFilter(
            icon: dataFilter[index]["icon"],
            label: dataFilter[index]["label"],
            isActive: index == posisiFilter,
          ),
        ),
      ),
    );
  }
}

class KotakFilter extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;

  const KotakFilter({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, right: 12, bottom: 8),
      width: 70,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: isActive
                  ? const LinearGradient(
                      colors: [Color(0xFF0B2F9F), Color(0xFF00809D)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              color: isActive ? null : Colors.grey[100],
              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: const Color(0xFF0B2F9F).withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : [],
            ),
            child: Icon(
              icon,
              size: 26,
              color: isActive ? Colors.white : Colors.black54,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? const Color(0xFF0B2F9F) : Colors.black54,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
