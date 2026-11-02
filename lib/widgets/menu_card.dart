import 'package:flutter/material.dart';

import '../models/menu.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.menu, required this.onTap});

  final Menu menu;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  menu.imagePath,
                  width: 88,
                  height: 88,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 88,
                    height: 88,
                    color: const Color(0xFFEAF0E5),
                    alignment: Alignment.center,
                    child: Text(menu.emoji, style: const TextStyle(fontSize: 34)),
                  ),
                ),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      menu.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF252D27),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      menu.category,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF858B82),
                      ),
                    ),
                    const SizedBox(height: 9),
                    Text(
                      formatRupiah(menu.price),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF285B46),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.chevron_right, color: Color(0xFF9DA49A)),
            ],
          ),
        ),
      ),
    );
  }
}
