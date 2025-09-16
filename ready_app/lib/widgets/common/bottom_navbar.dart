import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -1),
          ),
        ],
        border: Border(
          top: BorderSide(color: Colors.grey.shade100, width: 1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(
                context, 0, Icons.home_outlined, Icons.home, 'Ana Sayfa'),
            _buildNavItem(context, 1, Icons.chat_bubble_outline,
                Icons.chat_bubble, 'Sohbetler'),
            _buildNavItem(
                context, 2, Icons.explore_outlined, Icons.explore, 'Keşfet'),
            _buildNavItem(
                context, 3, Icons.person_outline, Icons.person, 'Profil'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, int index, IconData icon,
      IconData activeIcon, String label) {
    final bool isSelected = index == selectedIndex;
    final Color color =
        isSelected ? Theme.of(context).primaryColor : Colors.grey;

    return InkWell(
      onTap: () {
        if (index != selectedIndex) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$label sekmesine tıklandı')),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected ? activeIcon : icon,
            color: color,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
