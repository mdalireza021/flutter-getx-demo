class ProductItem {
  final int id;
  final String name;
  final String shortDescription;
  final String fullDescription;
  final String productPrice;
  final String imageUrl;
  final String fullSizeImageUrl;

  const ProductItem({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.fullDescription,
    required this.productPrice,
    required this.imageUrl,
    required this.fullSizeImageUrl,
  });
}