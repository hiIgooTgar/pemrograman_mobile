import 'package:flutter/material.dart';

class Smartphone extends StatelessWidget {
  const Smartphone({super.key});

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Center(
        child: Column(
          children: [
            Text("SMARTPHONE", style: TextStyle(fontSize: 30)),
            Padding(padding: EdgeInsetsGeometry.all(20)),
            Icon(Icons.smartphone, size: 90),
          ],
        ),
      ),
    );
  }
}
