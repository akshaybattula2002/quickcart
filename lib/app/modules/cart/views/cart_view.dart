import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import 'package:intl/intl.dart'; // For formatting Indian Rupees

class CartView extends GetView<CartController> {
  CartView({super.key}) {
    // Ensure the controller is registered
    if (!Get.isRegistered<CartController>()) {
      Get.put(CartController());
    }
  }

  final NumberFormat currencyFormat =
  NumberFormat.currency(locale: 'en_IN', symbol: '₹');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Review Your Order",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Obx(() {
              if (controller.cartItems.isEmpty) {
                return const Center(child: Text("Your cart is empty"));
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.cartItems.length,
                itemBuilder: (context, index) {
                  final item = controller.cartItems[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    elevation: 0, // Removed shadow
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          item["image"],
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(item["name"]),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Price: ${currencyFormat.format(item["price"])}"),
                          Text("Quantity: ${item["quantity"]}"),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => controller.decrementQuantity(item["name"]),
                          ),
                          Text("${item["quantity"]}"),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => controller.incrementQuantity(item["name"]),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
            const SizedBox(height: 10),
            Obx(() => Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  _buildSummaryRow("Subtotal", controller.subtotal),
                  const SizedBox(height: 5),
                  _buildSummaryRow("Shipping Fee", controller.shippingFee),
                  const SizedBox(height: 5),
                  _buildSummaryRow("Discount", -controller.discount),
                  const Divider(thickness: 1, height: 20),
                  _buildSummaryRow("Total", controller.total, isTotal: true),
                ],
              ),
            )),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (controller.cartItems.isEmpty) {
                    Get.snackbar("Cart Empty",
                        "Add some items before ordering",
                        snackPosition: SnackPosition.BOTTOM);
                  } else {
                    Get.snackbar("Order", "Your order has been placed!",
                        snackPosition: SnackPosition.BOTTOM);
                    controller.cartItems.clear();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Blue background
                  foregroundColor: Colors.white, // White text
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Order Now"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String title, double amount,
      {bool isTotal = false}) {
    final NumberFormat currencyFormat =
    NumberFormat.currency(locale: 'en_IN', symbol: '₹');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          currencyFormat.format(amount),
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: amount < 0 ? Colors.red : Colors.black,
          ),
        ),
      ],
    );
  }
}
