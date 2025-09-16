import 'package:flutter/material.dart';

class PhotosSection extends StatefulWidget {
  final List<String> photos;
  final ScrollController scrollController;

  const PhotosSection({
    Key? key,
    required this.photos,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<PhotosSection> createState() => _PhotosSectionState();
}

class _PhotosSectionState extends State<PhotosSection> {
  bool _showAllPhotos = false;

  void _scrollToAdditionalPhotos() {
    if (widget.photos.length > 6) {
      setState(() {
        _showAllPhotos = !_showAllPhotos;
      });

      if (_showAllPhotos) {
        // Animasyonlu bir şekilde aşağı kaydırma
        Future.delayed(const Duration(milliseconds: 100), () {
          widget.scrollController.animateTo(
            widget.scrollController.position.pixels +
                300, // Sabit bir değer veya hesaplanan bir yüksekliğe kaydır
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tüm fotoğraflar zaten görüntüleniyor')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // İlk 6 fotoğrafı göster veya tümünü göster
    final displayPhotos = _showAllPhotos
        ? widget.photos
        : (widget.photos.length > 6
            ? widget.photos.sublist(0, 6)
            : widget.photos);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(16),
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Fotoğraflar',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: _scrollToAdditionalPhotos,
                child: Text(
                  _showAllPhotos ? 'Küçült' : 'Hepsini Gör',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4), // Boşluğu azalttık
          GridView.builder(
            padding: EdgeInsets.zero, // Grid için padding'i sıfırla
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: displayPhotos.length,
            itemBuilder: (context, index) {
              return _buildPhotoItem(context, displayPhotos[index], index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoItem(BuildContext context, String url, int index) {
    return GestureDetector(
      onTap: () {
        _showPhotoDetail(context, url, index);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          url,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              color: Colors.grey.shade300,
              child: Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey.shade300,
              child: const Center(
                child: Icon(
                  Icons.error_outline,
                  color: Colors.red,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showPhotoDetail(BuildContext context, String url, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(
                title: Text('Fotoğraf ${index + 1}'),
                leading: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                backgroundColor: Theme.of(context).primaryColor, // Turuncu tema
              ),
              InteractiveViewer(
                panEnabled: true,
                boundaryMargin: const EdgeInsets.all(20),
                minScale: 0.5,
                maxScale: 3.0,
                child: Image.network(
                  url,
                  fit: BoxFit.contain,
                  height: MediaQuery.of(context).size.height * 0.6,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
