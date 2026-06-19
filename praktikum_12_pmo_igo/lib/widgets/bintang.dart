import 'package:flutter/material.dart';

class Bintang extends StatelessWidget {
  final int jmlBintang;

  const Bintang({super.key, required this.jmlBintang});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Icon(
            Icons.star,
            color: index < jmlBintang ? Colors.amber : Colors.grey[300],
            size: 18,
          );
        },
      ),
    );
  }
}
