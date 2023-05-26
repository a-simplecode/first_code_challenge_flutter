import 'package:first_code_challenge_flutter/components/nft_card.dart';
import 'package:first_code_challenge_flutter/components/progress.dart';
import 'package:flutter/material.dart';

class NftList extends StatefulWidget {
  const NftList({super.key});

  @override
  State<NftList> createState() => _NftListState();
}

class _NftListState extends State<NftList> {
  List<NFT> nfts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NFT List'),
      ),
      body: ListView.builder(
        itemCount: nfts.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == nfts.length) {
            return const Progress();
          } else {
            final NFT nft = nfts[index];
            return NftCard(
                imageUrl: nft.imageUrl, name: nft.name, price: nft.price);
          }
        },
      ),
    );
  }
}

class NFT {
  final String imageUrl;
  final String name;
  final String price;

  NFT({required this.imageUrl, required this.name, required this.price});
}
