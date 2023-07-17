import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Product extends StatelessWidget {
  final int id;
  final String name;
  final String shortDescription;
  final String fullDescription;
  final String productPrice;
  final String imageUrl;
  final String fullSizeImageUrl;

  const Product({
    super.key,
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.fullDescription,
    required this.productPrice,
    required this.imageUrl,
    required this.fullSizeImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.all(5),
      width: screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: FadeInImage.assetNetwork(
                // Placeholder image
                image: imageUrl, // Actual image URL
                height: 200,
                width: 300,
                placeholder: "assets/images/loading.png",
              )),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              shortDescription,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                context.goNamed(
                  "details",
                  pathParameters: {
                    'id': id.toString(),
                    'name': name.toString(),
                    'shortDescription': shortDescription.toString(),
                    'fullDescription': fullDescription.toString(),
                    'productPrice': productPrice.toString(),
                    'imageUrl': imageUrl.toString(),
                    'fullSizeImageUrl': fullDescription.toString()
                  },
                );
              },
              child: const Text("Details")),
        ],
      ),
    );
  }
}
