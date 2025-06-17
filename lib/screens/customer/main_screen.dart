import 'package:cartify/constants/app_sizes.dart';
import 'package:cartify/providers/navigation_provider.dart';
import 'package:cartify/screens/customer/cart_screen.dart';
import 'package:cartify/screens/customer/home_screen.dart';
import 'package:cartify/screens/customer/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  static final List<Widget> _pages = [
    const HomeScreen(),
    const CartScreen(),
    const OrdersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      body: _pages[navProvider.currentIndex],
      bottomNavigationBar: NavigationBar(
        height: AppSizes.inputHeight,
        selectedIndex: navProvider.currentIndex,
        onDestinationSelected: navProvider.updateIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(size: AppSizes.iconM, Icons.home_outlined),
            selectedIcon: Icon(size: AppSizes.iconM, Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(size: AppSizes.iconM, Icons.shopping_cart_outlined),
            selectedIcon: Icon(size: AppSizes.iconM, Icons.shopping_cart),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(size: AppSizes.iconM, Icons.receipt_long_outlined),
            selectedIcon: Icon(size: AppSizes.iconM, Icons.receipt_long),
            label: 'Orders',
          ),
        ],
      ),
    );
  }
}
