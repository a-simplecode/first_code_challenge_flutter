import 'dart:convert';
import 'package:first_code_challenge_flutter/components/progress.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NftDetails extends StatefulWidget {
  const NftDetails({super.key, required this.id});

  final String id;

  @override
  State<NftDetails> createState() => _NftDetailsState();
}

class _NftDetailsState extends State<NftDetails> {
  late NFT nft;
  bool isLoading = false;

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

    final response = await http
        .get(Uri.parse('https://api.coingecko.com/api/v3/nfts/${widget.id}'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      setState(() {
        nft = NFT.fromJson(data);
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
      body: Container(
        child: isLoading ? const Progress() : Text(nft.name),
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
