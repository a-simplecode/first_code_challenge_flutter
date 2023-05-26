import 'package:flutter/material.dart';
import 'package:first_code_challenge_flutter/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GradientContainer.baseColor(),
      ),
    ),
  );
}
