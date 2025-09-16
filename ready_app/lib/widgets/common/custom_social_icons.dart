import 'package:flutter/material.dart';

/// Özel sosyal medya iconları için widget
/// X (Twitter) için özel icon oluşturmak için kullanılabilir
class CustomSocialIcons {
  /// X (Twitter) için özel icon
  static Widget xIcon({double size = 22.0, Color color = Colors.white}) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: XIconPainter(color: color),
      ),
    );
  }
}

/// X (Twitter) logosunu çizen CustomPainter
class XIconPainter extends CustomPainter {
  final Color color;

  XIconPainter({this.color = Colors.white});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    // X şekli çizimi
    final Path path = Path();

    // Sol üstten sağ alta
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height);

    // Sağ üstten sol alta
    path.moveTo(0, size.height);
    path.lineTo(size.width, 0);

    // Çizimi tamamla
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Facebook için özel icon widget (gerekirse)
class FacebookIcon extends StatelessWidget {
  final double size;
  final Color color;

  const FacebookIcon({
    Key? key,
    this.size = 22.0,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.facebook,
      size: size,
      color: color,
    );
  }
}

/// Instagram için özel icon widget (gerekirse)
class InstagramIcon extends StatelessWidget {
  final double size;
  final Color color;

  const InstagramIcon({
    Key? key,
    this.size = 22.0,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.camera_alt,
      size: size,
      color: color,
    );
  }
}
