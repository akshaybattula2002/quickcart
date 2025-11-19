import 'package:get/get.dart';

import 'package:get/get.dart';

class Product {
  final String name;
  final String image;
  final String price;
  final String description; // <-- NEW FIELD

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.description, // <-- ADD HERE
  });
}

class FavoritesController extends GetxController {
  var favorites = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    favorites.addAll([
      Product(
        name: 'Clothes',
        image: 'assets/images/clothes.jpg',
        price: '₹200',
        description: 'Comfortable cotton t-shirt for daily wear.',
      ),
      Product(
        name: 'Nike Shoes',
        image: 'assets/images/nikeshoes.jpg',
        price: '₹1500',
        description: 'High-quality Nike running shoes with great support.',
      ),
      Product(
        name: 'Women Dress',
        image: 'assets/images/women.jpg',
        price: '₹300',
        description: 'Elegant women’s dress perfect for any occasion.',
      ),
    ]);
  }

  void toggleFavorite(Product product) {
    if (favorites.contains(product)) {
      favorites.remove(product);
    } else {
      favorites.add(product);
    }
  }

  bool isFavorite(Product product) {
    return favorites.contains(product);
  }
}

