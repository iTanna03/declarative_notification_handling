import 'package:flutter/material.dart';

class SomeScreen extends StatelessWidget {
  const SomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: FlutterLogo()),
    );
  }
}
