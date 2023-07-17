import 'package:flutter/material.dart';
import 'package:html/parser.dart' ;

import '../widgets/BuildAppBar.dart';

class ProductDetails extends StatefulWidget {
  final String id;
  final String name;
  final String shortDescription;
  final String fullDescription;
  final String productPrice;
  final String imageUrl;
  final String fullSizeImageUrl;

  const ProductDetails({
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
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    var doc = parse(widget.fullDescription);

    return Scaffold(
        appBar: buildAppBar(widget.name),
        body: Container(
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: FadeInImage.assetNetwork(
                      // Placeholder image
                      image: widget.imageUrl, // Actual image URL
                      height: 200,
                      width: 300,
                      placeholder: "assets/images/loading.png",
                    )),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(widget.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    widget.shortDescription,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("Price: ${widget.productPrice}USD only"
                    ,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(

                  padding: const EdgeInsets.all(15.0),
                  child:


                  Text(

                    doc.documentElement!.text,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          )
        ));
  }
}
