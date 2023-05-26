import 'dart:convert';
import 'package:first_code_challenge_flutter/components/nft_card.dart';
import 'package:first_code_challenge_flutter/components/progress.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NftDetails extends StatefulWidget {
  const NftDetails({super.key});

  @override
  State<NftDetails> createState() => _NftDetailsState();
}

class _NftDetailsState extends State<NftDetails> {
  List<NFT> nfts = [];
  int currentPage = 1;
  bool isLoading = false;
  static const int perPage = 10;

  @override
  void initState() {
    super.initState();
    loadNFTs();
  }

  Future<void> loadNFTs() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });

    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/nfts/list?per_page=$perPage&page=$currentPage'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      setState(() {
        nfts.addAll(data.map((item) => NFT.fromJson(item)).toList());
        currentPage++;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      // Handle error cases
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NFT Details'),
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

  factory NFT.fromJson(Map<String, dynamic> json) {
    return NFT(
      imageUrl: json['symbol'],
      name: json['name'],
      price: json['asset_platform_id'],
    );
  }
}
