import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profil_sayfasi/theme/theme.dart';
import 'screens/profile_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil Sayfası',
      theme: AppTheme.lightTheme, // Turuncu temayı kullanıyoruz
      home: const ProfilePage(),
    );
  }
}
