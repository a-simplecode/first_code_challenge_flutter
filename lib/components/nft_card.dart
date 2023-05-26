import 'package:first_code_challenge_flutter/nft_details.dart';
import 'package:flutter/material.dart';

class NftCard extends StatelessWidget {
  const NftCard(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.price,
      required this.id});

  final String id;
  final String imageUrl;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NftDetails(id: id)),
        )
      },
      child: Card(
        child: ListTile(
          // leading: Image.network(imageUrl),
          leading: Text(
            imageUrl,
            style: const TextStyle(fontSize: 35),
          ),
          title: Text(name),
          subtitle: Text('Price: \$$price'),
        ),
      ),
    );
  }
}
