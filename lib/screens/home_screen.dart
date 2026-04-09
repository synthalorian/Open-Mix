import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/mix_providers.dart';
import '../theme/studio_theme.dart';
import 'loudness_screen.dart';
import 'frequency_screen.dart';
import 'checklist_screen.dart';
import 'genre_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tab = ref.watch(selectedTabProvider);
    final screens = [
      const LoudnessScreen(),
      const FrequencyScreen(),
      const ChecklistScreen(),
      const GenreScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisSize: MainAxisSize.min, children: [
          Text('Open', style: TextStyle(color: StudioTheme.blue)),
          const Text('Mix'),
        ]),
      ),
      body: screens[tab],
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (i) => ref.read(selectedTabProvider.notifier).state = i,
        backgroundColor: StudioTheme.surface,
        indicatorColor: StudioTheme.blue.withAlpha(40),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.volume_up), label: 'Loudness'),
          NavigationDestination(icon: Icon(Icons.equalizer), label: 'Frequency'),
          NavigationDestination(icon: Icon(Icons.checklist), label: 'Checklist'),
          NavigationDestination(icon: Icon(Icons.library_music), label: 'Genres'),
        ],
      ),
    );
  }
}
