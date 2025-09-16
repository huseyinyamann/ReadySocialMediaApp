import 'package:flutter/material.dart';
import 'package:profil_sayfasi/models/SocialMediaAccount.dart';
import 'package:profil_sayfasi/widgets/common/bottom_navbar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/profile/profile_header.dart';
import '../widgets/profile/stats_section.dart';
import '../widgets/profile/social_media_section.dart';
import '../widgets/profile/photos_section.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Ana ScrollController
  final ScrollController _scrollController = ScrollController();

  // Kullanıcı bilgileri
  final String coverImageAsset =
      'assets/images/cigaratte.jpg'; // Yerel dosya yolu
  final String profileImageUrl =
      'https://instagram.fsaw1-14.fna.fbcdn.net/v/t51.2885-19/488489619_1386712699154366_1843794908565002358_n.jpg?_nc_ht=instagram.fsaw1-14.fna.fbcdn.net&_nc_cat=102&_nc_oc=Q6cZ2QGZBtHZs2q5il684JmWqANYLhfcrTowRp_K1KfgoF6jAt4qVFSaiUGkONXVhHYuoa0&_nc_ohc=2Xvzi4iAOBkQ7kNvwGRmbKX&_nc_gid=BLE41vuMyxYXx_LI6cue8w&edm=AP4sbd4BAAAA&ccb=7-5&oh=00_AfG8E91vDXm4GZ1vKoAFzYgRPmdNoR3UoJgoyS2CigsdUQ&oe=680EBBA7&_nc_sid=7a9f4b';
  final String name = 'Hüseyin Yaman';
  final String username = '@yamanhse';
  final String location = 'Ankara';
  final String maritalStatus = 'Evli';

  // İstatistikler
  final int followers = 10485;
  final int chats = 131;
  final int likes = 82761;
  final int following = 3451;
  // Yeni istatistikler
  final int frameCount = 21932;
  final int superMessages = 14507;
  final int conversations = 5283;

  // Sosyal medya hesapları
  late List<SocialMediaAccount> socialAccounts;

  // Fotoğraf URL'leri
  final List<String> photos = [
    'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?q=80&w=150',
    'https://images.unsplash.com/photo-1610438235354-a6ae5528385c?q=80&w=150',
    'https://images.unsplash.com/photo-1493246507139-91e8fad9978e?q=80&w=150',
    'https://images.unsplash.com/photo-1504674900247-0877df9cc836?q=80&w=150',
    'https://images.unsplash.com/photo-1485462537746-965f33f7f6a7?q=80&w=150',
    'https://images.unsplash.com/photo-1506929562872-bb421503ef21?q=80&w=150',
    'https://images.unsplash.com/photo-1517328894681-0f5dfabd463c?q=80&w=150',
    'https://images.unsplash.com/photo-1513542789411-b6a5d4f31634?q=80&w=150',
    'https://images.unsplash.com/photo-1524644388610-d973c5ff22ea?q=80&w=150',
  ];

  @override
  void initState() {
    super.initState();

    // Sosyal medya hesaplarını başlat
    socialAccounts = [
      SocialMediaAccount(
        name: 'Instagram',
        color: const Color(0xFFE4405F), // Instagram rengi
        icon: Icons.camera_alt,
        url: 'https://instagram.com/sarahanderson',
      ),
      SocialMediaAccount(
        name: 'X (Twitter)', // ProfilePage'de sadece Twitter gösterilecek
        color: const Color(0xFF1DA1F2), // Twitter rengi
        icon: Icons.android, // Twitter için ikon
        url: 'https://twitter.com/sarahanderson',
      ),
      SocialMediaAccount(
        name: 'Facebook',
        color: const Color(0xFF1877F2), // Facebook rengi
        icon: Icons.facebook,
        url: 'https://facebook.com/sarahanderson',
      ),
    ];
  }

  void _handleSendMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Mesaj gönderme işlevi')),
    );
  }

  void _handleMoreOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.block),
                title: const Text('Engelle'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Kullanıcı engellendi')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.report),
                title: const Text('Bildir'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Kullanıcı bildirildi')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Profili Paylaş'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Profil paylaşıldı')),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Geri butonu tıklandı')),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.settings, color: Colors.white),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ayarlar butonu tıklandı')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Profil Başlığı - Yerel dosya kullanım parametresi ile
            ProfileHeader(
              coverImageAsset: coverImageAsset, // Parametre adı değiştirildi
              profileImageUrl: profileImageUrl,
              name: name,
              username: username,
              location: location,
              maritalStatus: maritalStatus,
            ),

            // İstatistikler - Büyük sayılarla
            StatsSection(
              followers: followers,
              chats: chats,
              likes: likes,
              following: following,
              frameCount: frameCount,
              superMessages: superMessages,
              conversations: conversations,
            ),

            // Sosyal Medya Hesapları
            SocialMediaSection(socialAccounts: socialAccounts),

            // Fotoğraflar
            PhotosSection(
              photos: photos,
              scrollController: _scrollController,
            ),

            // Alt butonlar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: _handleSendMessage,
                      icon: const Icon(Icons.message),
                      label: const Text('Mesaj Gönder'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      onPressed: _handleMoreOptions,
                      icon: const Icon(Icons.more_horiz),
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 3),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
