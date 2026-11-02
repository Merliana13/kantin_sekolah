import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang kantin')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 28),
        children: [
          Container(
            height: 190,
            decoration: BoxDecoration(
              color: const Color(0xFF285B46),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 18,
                  bottom: 14,
                  child: Icon(
                    Icons.storefront_rounded,
                    size: 132,
                    color: Colors.white.withValues(alpha: 0.16),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('🏫', style: TextStyle(fontSize: 32)),
                      SizedBox(height: 10),
                      Text(
                        'Kantin Kita',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Tempat istirahat dan jajan kesukaanmu.',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Informasi kantin',
            style: Theme.of(context).textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 12),
          const _InfoTile(
            icon: Icons.access_time_rounded,
            title: 'Jam operasional',
            detail: 'Senin – Jumat, 07.00 – 15.00 WIB',
          ),
          const SizedBox(height: 10),
          const _InfoTile(
            icon: Icons.location_on_outlined,
            title: 'Lokasi',
            detail: 'Area kantin, dekat lapangan sekolah',
          ),
          const SizedBox(height: 10),
          const _InfoTile(
            icon: Icons.phone_outlined,
            title: 'Kontak pengurus',
            detail: 'Hubungi penjaga kantin saat jam sekolah',
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF0EBDD),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.favorite_outline, color: Color(0xFFB66D46)),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Kami menyediakan jajanan yang enak, terjangkau, dan disiapkan dengan penuh perhatian setiap hari.',
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 12,
                      color: Color(0xFF665E4E),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.icon,
    required this.title,
    required this.detail,
  });

  final IconData icon;
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFE8EEE4),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, color: const Color(0xFF285B46), size: 21),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF858B82),
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  detail,
                  style: const TextStyle(
                    color: Color(0xFF252D27),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
