import 'package:flutter/material.dart';

import '../models/menu.dart';
import 'about_page.dart';
import 'cart_page.dart';
import 'detail_page.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final Map<String, int> _cart = {};

  void _updateCart(Menu menu, int quantity) {
    setState(() {
      if (quantity <= 0) {
        _cart.remove(menu.id);
      } else {
        _cart[menu.id] = quantity;
      }
    });
  }

  void _openDetail(Menu menu) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => DetailPage(
          menu: menu,
          initialQuantity: _cart[menu.id] ?? 0,
          onAddToCart: (quantity) => _updateCart(menu, quantity),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(cartCount: _cart.values.fold(0, (sum, count) => sum + count), onMenuTap: _openDetail),
      CartPage(cart: _cart, onCartChanged: _updateCart),
      const AboutPage(),
    ];

    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.storefront_outlined),
            selectedIcon: Icon(Icons.storefront),
            label: 'Menu',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag_outlined),
            selectedIcon: Icon(Icons.shopping_bag),
            label: 'Keranjang',
          ),
          NavigationDestination(
            icon: Icon(Icons.info_outline),
            selectedIcon: Icon(Icons.info),
            label: 'Tentang',
          ),
        ],
      ),
    );
  }
}
