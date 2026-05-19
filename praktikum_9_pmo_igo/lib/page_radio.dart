import 'package:flutter/material.dart';

class Radio extends StatelessWidget {
  const Radio({super.key});

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Center(
        child: Column(
          children: [
            Text("RADIO", style: TextStyle(fontSize: 30)),
            Padding(padding: EdgeInsetsGeometry.all(20)),
            Icon(Icons.radio, size: 90),
          ],
        ),
      ),
    );
  }
}
