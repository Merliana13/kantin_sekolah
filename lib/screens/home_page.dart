import 'package:flutter/material.dart';

import '../models/menu.dart';
import '../widgets/menu_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.cartCount, required this.onMenuTap});

  final int cartCount;
  final ValueChanged<Menu> onMenuTap;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedCategory = 'Semua';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredMenu = kantinMenu.where((menu) {
      final matchesSearch = menu.name.toLowerCase().contains(_searchQuery);
      final matchesCategory =
          _selectedCategory == 'Semua' || menu.category == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'KANTIN SEKOLAH',
                        style: TextStyle(
                          color: Color(0xFF70806F),
                          fontSize: 11,
                          letterSpacing: 1.6,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Mau jajan apa hari ini?',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF202820),
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8EEE4),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Icon(Icons.shopping_bag_outlined,
                          color: Color(0xFF285B46)),
                      if (widget.cartCount > 0)
                        Positioned(
                          top: 4,
                          right: 3,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Color(0xFFE58E55),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '${widget.cartCount}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                height: 1,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _searchController,
              onChanged: (value) =>
                  setState(() => _searchQuery = value.trim().toLowerCase()),
              decoration: InputDecoration(
                hintText: 'Cari makanan favoritmu...',
                hintStyle: const TextStyle(
                    color: Color(0xFF9AA097), fontSize: 13),
                prefixIcon: const Icon(Icons.search, color: Color(0xFF70806F)),
                suffixIcon: _searchQuery.isEmpty
                    ? null
                    : IconButton(
                        tooltip: 'Hapus pencarian',
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
                        },
                        icon: const Icon(Icons.close),
                      ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 18),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF285B46),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Jajan enak, hati senang!',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Pilihan segar dari kantin sekolah',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.8),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('🥗', style: TextStyle(fontSize: 34)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Menu hari ini',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF202820),
                      ),
                ),
                const Spacer(),
                Text(
                  '${filteredMenu.length} pilihan',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF858B82),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 36,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: ['Semua', 'Makanan', 'Minuman'].map((category) {
                  final selected = _selectedCategory == category;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: selected,
                      onSelected: (_) =>
                          setState(() => _selectedCategory = category),
                      showCheckmark: false,
                      labelStyle: TextStyle(
                        color: selected ? Colors.white : const Color(0xFF667066),
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: const Color(0xFF285B46),
                      side: BorderSide.none,
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: filteredMenu.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('🔎', style: TextStyle(fontSize: 36)),
                          const SizedBox(height: 10),
                          Text(
                            'Menu tidak ditemukan',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Coba kata kunci yang lain, ya.',
                            style: TextStyle(
                              color: Color(0xFF858B82),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(bottom: 8),
                      itemCount: filteredMenu.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: MenuCard(
                          menu: filteredMenu[index],
                          onTap: () => widget.onMenuTap(filteredMenu[index]),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
