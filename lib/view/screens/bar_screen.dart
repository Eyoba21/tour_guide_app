import 'package:flutter/material.dart';

class BarScreen extends StatelessWidget {
  const BarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: const Center(child: Text('BarScreen')),
    );
  }
}