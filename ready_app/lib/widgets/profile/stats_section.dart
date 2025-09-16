import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Sayı formatlaması için

class StatsSection extends StatelessWidget {
  final int followers;
  final int chats;
  final int likes;
  final int following;
  final int frameCount;
  final int superMessages;
  final int conversations;

  const StatsSection({
    Key? key,
    required this.followers,
    required this.chats,
    required this.likes,
    required this.following,
    required this.frameCount,
    required this.superMessages,
    required this.conversations,
  }) : super(key: key);

  // Sayıları formatlayan yardımcı metod
  String _formatNumber(int number) {
    final NumberFormat formatter = NumberFormat.compact(locale: 'tr_TR');
    return formatter.format(number);
  }

  void _showStatsDetail(BuildContext context, String label, int value) {
    final NumberFormat fullFormatter = NumberFormat('#,###', 'tr_TR');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(label),
          content: Text('Toplam: ${fullFormatter.format(value)}'),
          actions: [
            TextButton(
              child: const Text('Kapat'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          // Üst bölüm: Çerçeve ve Super Mesaj
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCompactStat(
                    context, 21932, 'Çerçeve', primaryColor), // Büyük sayı
                Container(height: 30, width: 1, color: Colors.grey.shade200),
                _buildCompactStat(
                    context, 14507, 'Super Mesaj', primaryColor), // Büyük sayı
              ],
            ),
          ),

          // İnce ayırıcı çizgi
          Divider(
              color: Colors.grey.shade200,
              height: 1,
              thickness: 1,
              indent: 20,
              endIndent: 20),

          // Alt bölüm: Diğer istatistikler
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTinyStat(
                    context, 5283, 'Konuşmalar', primaryColor), // Büyük sayı
                _buildTinyStat(
                    context, 82761, 'Beğeni', primaryColor), // Büyük sayı
                _buildTinyStat(
                    context, 10485, 'Takipçi', primaryColor), // Büyük sayı
                _buildTinyStat(
                    context, 3451, 'Takip', primaryColor), // Büyük sayı
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Üst kısımdaki daha büyük istatistikler
  Widget _buildCompactStat(
      BuildContext context, int value, String label, Color primaryColor) {
    return GestureDetector(
      onTap: () => _showStatsDetail(context, label, value),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 100,
        child: Column(
          children: [
            Text(
              _formatNumber(value), // Formatlanmış sayı
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Alt kısımdaki daha küçük istatistikler
  Widget _buildTinyStat(
      BuildContext context, int value, String label, Color primaryColor) {
    return GestureDetector(
      onTap: () => _showStatsDetail(context, label, value),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 65, // Biraz genişletildi
        child: Column(
          children: [
            Text(
              _formatNumber(value), // Formatlanmış sayı
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey.shade500,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
