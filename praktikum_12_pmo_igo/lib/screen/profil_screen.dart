import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF0B2F9F), Color(0xFF00809D)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),
                  child: const SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 8,
                      ),
                      child: Text(
                        "Profil Pengguna",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -40,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 46,
                      backgroundColor: Color(0xFF00809D),
                      child: Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            const Text(
              "Igo Tegar Prambudhy",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              "igostrong@yahoo.com",
              style: TextStyle(fontSize: 13, color: Colors.grey[500]),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InfoWallet(
                      icon: Icons.account_balance_wallet_rounded,
                      color: Colors.orange,
                      title: "FoodPay",
                      value: "Rp 150.000",
                    ),
                    Container(height: 30, width: 1, color: Colors.grey[200]),
                    InfoWallet(
                      icon: Icons.stars_rounded,
                      color: Colors.amber,
                      title: "Poin",
                      value: "1.250 Pts",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  MenuProfilRow(
                    icon: Icons.person_outline_rounded,
                    iconColor: Colors.blue,
                    text: "Edit Profil",
                  ),
                  MenuProfilRow(
                    icon: Icons.location_on_outlined,
                    iconColor: Colors.redAccent,
                    text: "Alamat Pengiriman",
                  ),
                  MenuProfilRow(
                    icon: Icons.payment_outlined,
                    iconColor: Colors.purple,
                    text: "Metode Pembayaran",
                  ),
                  MenuProfilRow(
                    icon: Icons.security_rounded,
                    iconColor: Colors.green,
                    text: "Keamanan Akun",
                  ),
                  MenuProfilRow(
                    icon: Icons.help_outline_rounded,
                    iconColor: Colors.teal,
                    text: "Pusat Bantuan",
                  ),
                  const SizedBox(height: 10),
                  MenuProfilRow(
                    icon: Icons.logout_rounded,
                    iconColor: Colors.red,
                    text: "Keluar Akun",
                    isLast: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class InfoWallet extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String value;

  const InfoWallet({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 6),
            Text(
              title,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

class MenuProfilRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  final bool isLast;

  const MenuProfilRow({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.text,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor, size: 22),
        ),
        title: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: isLast ? Colors.red : Colors.black87,
            fontSize: 14,
          ),
        ),
        trailing: Icon(Icons.chevron_right_rounded, color: Colors.grey[400]),
        onTap: () {},
      ),
    );
  }
}
