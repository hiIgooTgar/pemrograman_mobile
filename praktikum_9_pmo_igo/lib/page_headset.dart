import 'package:flutter/material.dart';

class Headset extends StatelessWidget {
  const Headset({super.key});

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Center(
        child: Column(
          children: [
            Text("HEADSET", style: TextStyle(fontSize: 30)),
            Padding(padding: EdgeInsetsGeometry.all(20)),
            Icon(Icons.headset, size: 90),
          ],
        ),
      ),
    );
  }
}
