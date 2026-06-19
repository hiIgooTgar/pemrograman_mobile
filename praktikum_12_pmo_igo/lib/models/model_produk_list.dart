class ProdukModel {
  final String namaProduk;
  final String hargaNormal;
  final String hargaCoret;
  final int jmlBintang;
  final String gambar;
  final String deskripsi;
  final String porsi;

  ProdukModel({
    required this.namaProduk,
    required this.hargaNormal,
    required this.hargaCoret,
    required this.jmlBintang,
    required this.gambar,
    required this.deskripsi,
    required this.porsi,
  });
}

final List<ProdukModel> dataProdukUtama = [
  ProdukModel(
    namaProduk: "Ramen Gekikara Spicy",
    hargaNormal: "35.000",
    hargaCoret: "45.000",
    jmlBintang: 5,
    gambar:
        "https://images.unsplash.com/photo-1569718212165-3a8278d5f624?q=80&w=500&auto=format&fit=crop",
    deskripsi:
        "Ramen khas Jepang super pedas dengan kuah kaldu kental melimpah, mi kenyal pilihan, dilengkapi irisan daging premium, telur rebus setengah matang, nori, dan taburan daun bawang segar.",
    porsi: "1 Porsi Jumbo / 650 kCal",
  ),
  ProdukModel(
    namaProduk: "Sushi Platter Premium",
    hargaNormal: "68.000",
    hargaCoret: "85.000",
    jmlBintang: 4,
    gambar:
        "https://images.unsplash.com/photo-1579871494447-9811cf80d66c?q=80&w=500&auto=format&fit=crop",
    deskripsi:
        "Kombinasi sushi roll terbaik mulai dari salmon mentai, tuna mayo, kani roll, hingga nigiri premium yang diolah higienis oleh chef berpengalaman lengkap dengan wasabi dan shoyu.",
    porsi: "1 Set (12 Pcs) / 450 kCal",
  ),
  ProdukModel(
    namaProduk: "Matcha Latte Ice Cream",
    hargaNormal: "22.000",
    hargaCoret: "30.000",
    jmlBintang: 5,
    gambar:
        "https://images.unsplash.com/photo-1536256263959-770b48d82b0a?q=80&w=500&auto=format&fit=crop",
    deskripsi:
        "Minuman serbuk matcha asli Uji, Kyoto yang di-blend lembut bersama susu segar premium, disajikan dingin dengan toping satu scope es krim vanila lembut di atasnya.",
    porsi: "1 Gelas Besar / 320 kCal",
  ),
];
