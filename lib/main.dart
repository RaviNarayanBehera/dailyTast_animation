import 'package:flutter/material.dart';

import 'plane_animation.dart';
import 'drag_&_drop.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlaneAnimation(),
    );
  }
}
