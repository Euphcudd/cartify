import 'package:cartify/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cartify/constants/app_colors.dart';
import 'package:cartify/constants/app_sizes.dart';
import 'package:cartify/providers/navigation_provider.dart';
import 'package:cartify/screens/customer/cart%20screen/cart_screen.dart';
import 'package:cartify/screens/customer/storescreen/store_screen.dart';
import 'package:cartify/screens/customer/orders_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final List<Widget> _pages = [
    const StoreScreen(),
    const CartScreen(),
    const OrdersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navProvider = context.watch<NavigationProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: _pages[navProvider.currentIndex],
      bottomNavigationBar: NavigationBar(
        height: AppSizes.inputHeight,
        selectedIndex: navProvider.currentIndex,
        onDestinationSelected: navProvider.updateIndex,
        indicatorColor: AppColors.surfaceVariant,
        backgroundColor: AppColors.surface,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.storefront_outlined, size: AppSizes.iconM),
            selectedIcon: Icon(Icons.storefront_rounded, size: AppSizes.iconM),
            label: 'Store',
          ),
          NavigationDestination(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.shopping_cart_outlined, size: AppSizes.iconM),

                // Badge (unselected)
                Positioned(
                  top: -4,
                  right: -6,
                  child: Consumer<CartProvider>(
                    builder: (context, cart, _) {
                      final int itemCount = cart.items.fold(
                        0,
                        (sum, item) => sum + item.quantity,
                      );
                      return itemCount > 0
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(
                                  0.7,
                                ), // transparent black
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '$itemCount',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
            selectedIcon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.shopping_cart, size: AppSizes.iconM),

                // Badge (selected)
                Positioned(
                  top: -4,
                  right: -6,
                  child: Consumer<CartProvider>(
                    builder: (context, cart, _) {
                      final int itemCount = cart.items.fold(
                        0,
                        (sum, item) => sum + item.quantity,
                      );
                      return itemCount > 0
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(
                                  0.7,
                                ), // transparent black
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '$itemCount',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
            label: 'Cart',
          ),

          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined, size: AppSizes.iconM),
            selectedIcon: Icon(Icons.receipt_long, size: AppSizes.iconM),
            label: 'Orders',
          ),
        ],
      ),
    );
  }
}
