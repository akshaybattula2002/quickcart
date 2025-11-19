import 'package:get/get.dart';

class NavBarController extends GetxController {
  /// Current selected tab
  RxInt selectedIndex = 0.obs;

  /// Switch tab
  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
