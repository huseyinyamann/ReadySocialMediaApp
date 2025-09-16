import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String coverImageAsset; // URL yerine asset yolu
  final String profileImageUrl;
  final String name;
  final String username;
  final String location;
  final String maritalStatus;

  const ProfileHeader({
    Key? key,
    required this.coverImageAsset, // Parametre adı değiştirildi
    required this.profileImageUrl,
    required this.name,
    required this.username,
    required this.location,
    required this.maritalStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Kapak Fotoğrafı
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            // Kapak fotoğrafı - NetworkImage yerine AssetImage kullanılıyor
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(coverImageAsset), // Asset yolu kullanılıyor
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // Profil fotoğrafı overlay
            Positioned(
              bottom: -50,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Profil fotoğrafı
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                    ),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey.shade200,
                      backgroundImage: NetworkImage(profileImageUrl),
                    ),
                  ),

                  // Hikaye göstergesi
                  Positioned(
                    right: -2,
                    top: -2,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add_circle,
                        color: Theme.of(context).primaryColor,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        // Profil bilgileri
        Container(
          padding:
              const EdgeInsets.only(top: 55, bottom: 15, left: 16, right: 16),
          child: Column(
            children: [
              // İsim
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),

              // Kullanıcı adı
              Text(
                username,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 12),

              // Durum belirteçleri
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Çevrimiçi',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green.shade700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      maritalStatus,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Konum
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 16,
                    color: Colors.grey.shade700,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Ankara, TR',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
