import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'screens/home_screen.dart';
import 'screens/result_screen.dart';
import 'screens/about_screen.dart';

void main() {
  runApp(const ProxyApp());
}

class ProxyApp extends StatelessWidget {
  const ProxyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Proxy Me Please',
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/result': (context) => const ResultScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}
