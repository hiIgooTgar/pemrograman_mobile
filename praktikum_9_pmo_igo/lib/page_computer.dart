import 'package:flutter/material.dart';

class Computer extends StatelessWidget {
  const Computer({super.key});

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Center(
        child: Column(
          children: [
            Text("KOMPUTER", style: TextStyle(fontSize: 30)),
            Padding(padding: EdgeInsetsGeometry.all(20)),
            Icon(Icons.computer, size: 90),
          ],
        ),
      ),
    );
  }
}
