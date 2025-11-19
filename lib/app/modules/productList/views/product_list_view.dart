import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_list_controller.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        'name': 'Nike Shoes',
        'image': 'assets/images/nikeshoes.jpg',
        'price': '₹1500',
        'description': 'High-quality Nike running shoes with great support.'
      },
      {
        'name': 'T-Shirt',
        'image': 'assets/images/clothes.jpg',
        'price': '₹249',
        'description': 'Comfortable cotton T-shirt, perfect for casual wear.'
      },
      {
        'name': 'Dress',
        'image': 'assets/images/women.jpg',
        'price': '₹499',
        'description': 'Elegant dress suitable for parties and outings.'
      },
      {
        'name': 'Sneakers',
        'image': 'assets/images/nikeshoes.jpg',
        'price': '₹899',
        'description': 'Stylish sneakers for everyday comfort and style.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Search Card with Filter button
// Search Card with Filter button
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              // elevation: 4,  // Removed elevation
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Search products...',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          print('Search: $value');
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        print('Filter pressed');
                      },
                      icon: const Icon(Icons.filter_list),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Grid of products
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Image.asset(
                              product['image']!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product['name']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  product['price']!,
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  product['description'] ?? '',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

          ],
        ),
      ),
    );
  }
}
