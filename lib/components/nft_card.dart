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
    return Card(
      child: ListTile(
        leading: Image.network(imageUrl),
        title: Text(name),
        subtitle: Text('Price: \$$price'),
      ),
    );
  }
}
