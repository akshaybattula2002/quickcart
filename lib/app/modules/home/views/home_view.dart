import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../constants/productCard.dart';
import '../../productList/views/product_list_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Local images from assets
    final List<String> imgList = [
      'assets/images/clothes.jpg',
      'assets/images/nikeshoes.jpg',
      'assets/images/women.jpg',
    ];

    // Sample categories
    final List<Map<String, String>> categories = [
      {'name': 'Clothes', 'image': 'assets/images/clothes.jpg'},
      {'name': 'Shoes', 'image': 'assets/images/nikeshoes.jpg'},
      {'name': 'Women', 'image': 'assets/images/women.jpg'},
      {'name': 'Men', 'image': 'assets/images/clothes.jpg'},
      {'name': 'Kids', 'image': 'assets/images/women.jpg'},
    ];

    // Sample popular products
    final List<Map<String, String>> popularProducts = [
      {'name': 'Nike Shoes', 'image': 'assets/images/nikeshoes.jpg', 'price': '₹299'},
      {'name': 'T-Shirt', 'image': 'assets/images/clothes.jpg', 'price': '₹249'},
      {'name': 'Dress', 'image': 'assets/images/women.jpg', 'price': '₹499'},
      {'name': 'Sneakers', 'image': 'assets/images/nikeshoes.jpg', 'price': '₹899'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ecommerce App'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Get.to(() => const ProductListView());
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Get.snackbar('Notifications', 'Notification button clicked');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel Slider
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                aspectRatio: 16 / 9,
                autoPlayInterval: const Duration(seconds: 3),
              ),
              items: imgList.map((item) => Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              )).toList(),
            ),

            const SizedBox(height: 20),

            // Categories Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: const Text(
                'Categories',
                style: TextStyle(fontSize: 18,),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Container(
                    width: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            category['image']!,
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(category['name']!, style: const TextStyle(fontSize: 14)),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Popular Products Section using ProductCard (ListView)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: const Text(
                'Popular Products',
                style: TextStyle(fontSize: 18,),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 170, // Fixed height for product cards
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                itemCount: popularProducts.length,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final product = popularProducts[index];
                  return SizedBox(
                    // width: 140, // Fixed width for all cards
                    child: ProductCard(
                      name: product['name']!,
                      image: product['image']!,
                      price: product['price']!,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
