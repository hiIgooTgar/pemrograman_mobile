import 'package:flutter/material.dart';
import '../models/model_produk_list.dart';
import '../screen/detail_produk.dart';
import 'bintang.dart';

class ListProduk extends StatelessWidget {
  final List<ProdukModel> dataProdukList;

  const ListProduk({super.key, required this.dataProdukList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dataProdukList.length,
        itemBuilder: (context, index) {
          final produk = dataProdukList[index];
          return KotakProduk(produk: produk);
        },
      ),
    );
  }
}

class KotakProduk extends StatelessWidget {
  final ProdukModel produk;

  const KotakProduk({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailProduk(produk: produk)),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 40, left: 8, right: 8, bottom: 10),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 170,
              height: 230,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      produk.namaProduk,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Bintang(jmlBintang: produk.jmlBintang),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          "Rp ${produk.hargaCoret}",
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rp ${produk.hargaNormal}",
                          style: const TextStyle(
                            color: Color(0xFF0B2F9F),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF0B2F9F), Color(0xFF00809D)],
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -35,
              left: 20,
              right: 20,
              child: Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(produk.gambar),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
