import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

// Import your screens
import '../../home/views/home_view.dart';
import '../../cart/views/cart_view.dart';
import '../../profile/views/profile_view.dart';
import '../../categories/views/categories_view.dart'; // <-- new
import '../../favorites/views/favorites_view.dart';   // <-- new
import '../controllers/nav_bar_controller.dart';

class NavBarView extends GetView<NavBarController> {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: const HomeView(),
          item: ItemConfig(
            icon: Icon(Icons.home),
            title: "Home",
          ),
        ),
        PersistentTabConfig(
          screen: const CategoriesView(),  // <-- new
          item: ItemConfig(
            icon: Icon(Icons.category),
            title: "Categories",
          ),
        ),
        PersistentTabConfig(
          screen:  CartView(),
          item: ItemConfig(
            icon: Icon(Icons.shopping_cart),
            title: "Cart",
          ),
        ),
        PersistentTabConfig(
          screen:  FavoritesView(),   // <-- new
          item: ItemConfig(
            icon: Icon(Icons.favorite),
            title: "Favorites",
          ),
        ),
        PersistentTabConfig(
          screen: const ProfileView(),
          item: ItemConfig(
            icon: Icon(Icons.person),
            title: "Profile",
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style6BottomNavBar(
        navBarConfig: navBarConfig,
      ),
    );
  }
}
