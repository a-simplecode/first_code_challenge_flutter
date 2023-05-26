import 'package:first_code_challenge_flutter/nft_list.dart';
import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key});

  const GradientContainer.baseColor({super.key})
      : color1 = const Color.fromARGB(255, 252, 251, 251),
        color2 = const Color.fromARGB(255, 205, 253, 255);

  final Color color1;
  final Color color2;

  @override
  Widget build(context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color1, color2],
              begin: startAlignment,
              end: endAlignment),
        ),
        child: const Center(
          child: NftList(),
        ));
  }
}
