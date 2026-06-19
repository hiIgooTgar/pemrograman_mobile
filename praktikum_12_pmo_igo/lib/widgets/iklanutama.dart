import 'dart:async';
import 'package:flutter/material.dart';

final PageController controllerIklan = PageController(initialPage: 0);
int posisiIklan = 0;

final List<Map<String, dynamic>> dataIklanList = [
  {
    "gambar":
        "https://images.unsplash.com/photo-1606787366850-de6330128bfc?q=80&w=600&auto=format&fit=crop",
    "judul": "Diskon Kuliner Spektakuler",
    "deskripsi":
        "Nikmati potongan harga s.d 50% khusus pengguna baru hari ini!",
  },
  {
    "gambar":
        "https://images.unsplash.com/photo-1504674900247-0877df9cc836?q=80&w=600&auto=format&fit=crop",
    "judul": "Gratis Ongkir Sepuasnya",
    "deskripsi":
        "Belanja minimal Rp 30rb langsung bebas ongkir seluruh Indonesia.",
  },
  {
    "gambar":
        "https://images.unsplash.com/photo-1498837167922-ddd27525d352?q=80&w=600&auto=format&fit=crop",
    "judul": "Menu Sehat & Segar",
    "deskripsi": "Varian salad dan jus buah organik diskon up to 30%.",
  },
];

class IklanUtama extends StatefulWidget {
  const IklanUtama({super.key});

  @override
  State<IklanUtama> createState() => _IklanUtamaState();
}

class _IklanUtamaState extends State<IklanUtama> {
  Timer? _timerIklan;

  @override
  void initState() {
    super.initState();
    _mulaiGeserOtomatis();
  }

  @override
  void dispose() {
    _timerIklan?.cancel();
    super.dispose();
  }

  void _mulaiGeserOtomatis() {
    _timerIklan = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (controllerIklan.hasClients) {
        int halamanBerikutnya = posisiIklan + 1;
        if (halamanBerikutnya >= dataIklanList.length) {
          halamanBerikutnya = 0;
        }

        controllerIklan.animateToPage(
          halamanBerikutnya,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160,
          child: PageView(
            controller: controllerIklan,
            onPageChanged: (value) {
              setState(() {
                posisiIklan = value;
              });
            },
            children: dataIklanList.map((e) {
              return GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e["judul"]),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: const Color(0xFF0B2F9F),
                    ),
                  );
                },
                child: KotakIklan(
                  gambar: e["gambar"],
                  judul: e["judul"],
                  deskripsi: e["deskripsi"],
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: dataIklanList.map((e) {
            int index = dataIklanList.indexOf(e);
            bool isSelected = index == posisiIklan;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: isSelected ? 24 : 8,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF0B2F9F) : Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class KotakIklan extends StatelessWidget {
  final String gambar;
  final String judul;
  final String deskripsi;

  const KotakIklan({
    super.key,
    required this.gambar,
    required this.judul,
    required this.deskripsi,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: NetworkImage(gambar), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0.1),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              judul,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              deskripsi,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
