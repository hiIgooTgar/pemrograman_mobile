import 'package:flutter/material.dart';

class NavbarNav extends StatelessWidget implements PreferredSizeWidget {
  const NavbarNav({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(255, 132, 41, 134),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/logo_amikom_white.png',
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 10),
          const Text(
            "Praktikum 11 - Informatika",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
