import 'package:first_code_challenge_flutter/nft_details.dart';
import 'package:flutter/material.dart';

class NftCard extends StatelessWidget {
  const NftCard(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.price});

  final String imageUrl;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NftDetails()),
        )
      },
      child: Card(
        child: ListTile(
          // leading: Image.network(imageUrl),
          leading: Text(imageUrl),
          title: Text(name),
          subtitle: Text('Price: \$$price'),
        ),
      ),
    );
  }
}
