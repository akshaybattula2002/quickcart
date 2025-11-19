import 'package:get/get.dart';

class CartController extends GetxController {
  // Cart items: name, price, quantity
  var cartItems = <Map<String, dynamic>>[].obs;


  @override
  void onInit() {
    super.onInit();
    // Optional: initialize with some items
    cartItems.addAll([
      {
        "name": "Product 1",
        "price": 220.0,
        "quantity": 1,
        "image": "assets/images/clothes.jpg" // Path for product 1 image
      },
      {
        "name": "Product 2",
        "price": 350.0,
        "quantity": 2,
        "image": "assets/images/women.jpg"   // Path for product 2 image
      },
    ]);
  }

  void addItem(Map<String, dynamic> item) {
    // Check if item exists
    int index = cartItems.indexWhere((i) => i["name"] == item["name"]);
    if (index >= 0) {
      cartItems[index]["quantity"] += 1;
      cartItems.refresh();
    } else {
      cartItems.add(item);
    }
  }

  void removeItem(String name) {
    cartItems.removeWhere((item) => item["name"] == name);
  }

  void incrementQuantity(String name) {
    int index = cartItems.indexWhere((item) => item["name"] == name);
    if (index >= 0) {
      cartItems[index]["quantity"] += 1;
      cartItems.refresh();
    }
  }

  void decrementQuantity(String name) {
    int index = cartItems.indexWhere((item) => item["name"] == name);
    if (index >= 0) {
      if (cartItems[index]["quantity"] > 1) {
        cartItems[index]["quantity"] -= 1;
      } else {
        cartItems.removeAt(index);
      }
      cartItems.refresh();
    }
  }

  double get subtotal => cartItems.fold(
      0, (sum, item) => sum + (item["price"] as double) * (item["quantity"] as int));

  double shippingFee = 5.0;
  double discount = 10.0;

  double get total => subtotal + shippingFee - discount;
}
