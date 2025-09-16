# Profil Sayfası Arayüzü

Bu proje, Flutter kullanılarak geliştirilmiş modern ve şık bir sosyal medya profil sayfası kullanıcı arayüzüdür.

##  Ekran Görüntüleri

Uygulamanın nasıl göründüğünü aşağıda görebilirsiniz. Kendi ekran görüntülerinizi eklemek için `screenshots` klasörüne resimlerinizi yükleyip aşağıdaki linkleri güncelleyebilirsiniz.

| Profil (Üst Kısım) | Profil (Alt Kısım) |
| :---: | :---: |
| <img src="screenshots/436579122-965e4d6c-3d3b-4e3c-9147-36d23fee099a.png" width="300"> | <img src="screenshots/436579146-048ecf6f-ea12-42db-b135-2ca45634c411.png" width="300"> |

<br>
<p align="center">
  <img src="screenshots/436579163-42297f63-6931-4c0d-9150-fb1b8ce1a5da.png" width="300">
</p>


## Özellikler

- **Profil Başlığı:** Kullanıcının kapak fotoğrafı, profil resmi, adı, kullanıcı adı, konumu ve medeni durumu.
- **İstatistikler:** Takipçi, sohbet, beğeni, takip edilen, çerçeve sayısı, süper mesajlar ve konuşmalar gibi detaylı kullanıcı istatistikleri.
- **Sosyal Medya Entegrasyonu:** Instagram, X (Twitter) ve Facebook gibi sosyal medya hesaplarına yönlendirme linkleri.
- **Fotoğraf Galerisi:** Kullanıcının fotoğraflarını gösteren kaydırılabilir bir bölüm.
- **Etkileşim Butonları:** "Mesaj Gönder" ve "Daha Fazla Seçenek" (Engelle, Bildir, Paylaş) gibi kullanıcı etkileşim fonksiyonları.
- **Modern Tasarım:** Genişletilebilir `AppBar` ve şık alt gezinme çubuğu (`BottomNavBar`) ile modern bir görünüm.

## Başlarken

Bu projeyi yerel makinenizde çalıştırmak için aşağıdaki adımları izleyin.

### Gereksinimler

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- Bir kod düzenleyici (örn. VS Code, Android Studio)

### Kurulum

1. Projeyi klonlayın:
   ```sh
   git clone https://github.com/kullanici-adiniz/ReadySocialMediaApp.git
   ```
2. Proje dizinine gidin:
   ```sh
   cd ReadySocialMediaApp/ready_app
   ```
3. Bağımlılıkları yükleyin:
   ```sh
   flutter pub get
   ```
4. Projeyi çalıştırın:
   ```sh
   flutter run
   ```

## Kullanılan Teknolojiler ve Bağımlılıklar

- **Flutter:** Google tarafından geliştirilen açık kaynaklı bir UI yazılım geliştirme kitidir.
- **cupertino_icons:** iOS tarzı ikonlar için.
- **url_launcher:** Harici linkleri (sosyal medya profilleri gibi) açmak için.
- **intl:** Tarih ve sayı formatlaması gibi uluslararasılaştırma görevleri için.
