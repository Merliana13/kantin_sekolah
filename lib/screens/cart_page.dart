import 'package:flutter/material.dart';

import '../models/menu.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
    required this.cart,
    required this.onCartChanged,
  });

  final Map<String, int> cart;
  final void Function(Menu menu, int quantity) onCartChanged;

  @override
  Widget build(BuildContext context) {
    final entries = kantinMenu
        .where((menu) => (cart[menu.id] ?? 0) > 0)
        .toList();
    final total = entries.fold<int>(
      0,
      (sum, menu) => sum + menu.price * (cart[menu.id] ?? 0),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang belanja')),
      body: entries.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 92,
                      height: 92,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE8EEE4),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        size: 42,
                        color: Color(0xFF285B46),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'Keranjangmu masih kosong',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Yuk, pilih jajanan favoritmu dulu.',
                      style: TextStyle(color: Color(0xFF858B82)),
                    ),
                  ],
                ),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemCount: entries.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final menu = entries[index];
                      final quantity = cart[menu.id] ?? 0;
                      return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                menu.imagePath,
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                  width: 70,
                                  height: 70,
                                  color: const Color(0xFFE8EEE4),
                                  alignment: Alignment.center,
                                  child: Text(menu.emoji,
                                      style: const TextStyle(fontSize: 28)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    menu.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    formatRupiah(menu.price * quantity),
                                    style: const TextStyle(
                                      color: Color(0xFF285B46),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              tooltip: 'Kurangi porsi',
                              onPressed: () =>
                                  onCartChanged(menu, quantity - 1),
                              icon: const Icon(Icons.remove_circle_outline),
                              color: const Color(0xFF718071),
                            ),
                            Text(
                              '$quantity',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700),
                            ),
                            IconButton(
                              tooltip: 'Tambah porsi',
                              onPressed: () =>
                                  onCartChanged(menu, quantity + 1),
                              icon: const Icon(Icons.add_circle_outline),
                              color: const Color(0xFF285B46),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 22),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(top: BorderSide(color: Color(0xFFECEDE8))),
                  ),
                  child: SafeArea(
                    top: false,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Total pesanan',
                                style: TextStyle(
                                  color: Color(0xFF858B82),
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                formatRupiah(total),
                                style: const TextStyle(
                                  color: Color(0xFF285B46),
                                  fontWeight: FontWeight.w800,
                                  fontSize: 19,
                                ),
                              ),
                            ],
                          ),
                        ),
                        FilledButton(
                          onPressed: () => showDialog<void>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Pesanan siap!'),
                              content: const Text(
                                'Tunjukkan daftar pesanan ini kepada penjaga kantin untuk melakukan pembayaran.',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Mengerti'),
                                ),
                              ],
                            ),
                          ),
                          child: const Text('Pesan sekarang'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
