import 'package:flutter/material.dart';
import 'package:first_code_challenge_flutter/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer.baseColor(),
      ),
    ),
  );
}
