class Menu {
  const Menu({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.category,
    required this.emoji,
  });

  final String id;
  final String name;
  final String description;
  final int price;
  final String imagePath;
  final String category;
  final String emoji;
}

const List<Menu> kantinMenu = [
  Menu(
    id: 'mie-ayam',
    name: 'Mi Ayam',
    description:
        'Mi kenyal dengan ayam berbumbu gurih, sawi segar, dan kuah kaldu hangat. Dibuat fresh setiap hari.',
    price: 12000,
    imagePath: 'assets/images/mie_ayam.png',
    category: 'Makanan',
    emoji: '🍜',
  ),
  Menu(
    id: 'batagor',
    name: 'Batagor',
    description:
        'Tahu dan adonan ikan yang digoreng renyah, disiram bumbu kacang khas kantin.',
    price: 10000,
    imagePath: 'assets/images/batagor.png',
    category: 'Makanan',
    emoji: '🥟',
  ),
  Menu(
    id: 'es-teh',
    name: 'Es Teh Manis',
    description:
        'Teh pilihan yang diseduh pas, disajikan dingin dengan manis yang menyegarkan.',
    price: 5000,
    imagePath: 'assets/images/es_teh.png',
    category: 'Minuman',
    emoji: '🧋',
  ),
  Menu(
    id: 'bakso',
    name: 'Bakso',
    description:
        'Bakso sapi kenyal dalam kuah kaldu hangat, lengkap dengan mi, sayur, dan bawang goreng.',
    price: 12000,
    imagePath: 'assets/images/bakso.png',
    category: 'Makanan',
    emoji: '🍲',
  ),
  Menu(
    id: 'nasi-goreng',
    name: 'Nasi Goreng',
    description:
        'Nasi goreng harum dengan telur, sayuran, dan bumbu racikan sederhana yang nikmat.',
    price: 15000,
    imagePath: 'assets/images/nasi_goreng.png',
    category: 'Makanan',
    emoji: '🍛',
  ),
];

String formatRupiah(int amount) {
  final digits = amount.toString();
  final formatted = StringBuffer();
  for (var index = 0; index < digits.length; index++) {
    if (index > 0 && (digits.length - index) % 3 == 0) {
      formatted.write('.');
    }
    formatted.write(digits[index]);
  }
  return 'Rp${formatted.toString()}';
}
