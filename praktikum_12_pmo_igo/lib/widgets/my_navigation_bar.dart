import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MyBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF0B2F9F);
    const Color secondaryColor = Color(0xFF00809D);
    const Color selectedColor = Colors.yellow;
    const Color unselectedColor = Colors.white70;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryColor, secondaryColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border(
          top: BorderSide(color: Colors.white.withOpacity(0.15), width: 1.5),
        ),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.3),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: selectedColor,
        unselectedItemColor: unselectedColor,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 0.3,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          letterSpacing: 0.3,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Icon(
                currentIndex == 0 ? Icons.home_rounded : Icons.home_outlined,
                size: 26,
              ),
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Icon(
                currentIndex == 1
                    ? Icons.favorite_rounded
                    : Icons.favorite_outline_rounded,
                size: 26,
              ),
            ),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Icon(
                currentIndex == 2
                    ? Icons.shopping_bag_rounded
                    : Icons.shopping_bag_outlined,
                size: 26,
              ),
            ),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Icon(
                currentIndex == 3
                    ? Icons.person_rounded
                    : Icons.person_outline_rounded,
                size: 26,
              ),
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
