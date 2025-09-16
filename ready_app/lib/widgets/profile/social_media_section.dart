import 'package:flutter/material.dart';
import 'package:profil_sayfasi/models/SocialMediaAccount.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaSection extends StatelessWidget {
  final List<SocialMediaAccount> socialAccounts;

  const SocialMediaSection({
    Key? key,
    required this.socialAccounts,
  }) : super(key: key);

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('URL açılamadı: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sosyal Medya',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Instagram, Twitter, Facebook için 3
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 80,
            ),
            itemCount: socialAccounts.length,
            itemBuilder: (context, index) {
              final account = socialAccounts[index];
              return _buildSocialMediaItem(context, account);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaItem(
      BuildContext context, SocialMediaAccount account) {
    // Twitter için özel ad düzeltmesi
    String displayName = account.name;
    if (displayName == 'X (Twitter)') {
      displayName = 'Twitter';
    }

    return InkWell(
      onTap: () => _launchUrl(account.url),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: account.color,
              shape: BoxShape.circle,
            ),
            child: Icon(
              account.icon,
              color: Colors.white,
              size: 22,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            displayName, // X (Twitter) yerine sadece Twitter gösteriliyor
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
