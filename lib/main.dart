import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/home_screen.dart';
import 'theme/studio_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('open_mix');
  runApp(const ProviderScope(child: OpenMixApp()));
}

class OpenMixApp extends StatelessWidget {
  const OpenMixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OpenMix',
      debugShowCheckedModeBanner: false,
      theme: StudioTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
