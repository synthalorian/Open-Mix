import 'package:flutter/material.dart';
import '../data/genre_presets.dart';
import '../theme/studio_theme.dart';

class GenreScreen extends StatelessWidget {
  const GenreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: genrePresets.length,
      itemBuilder: (context, index) {
        final g = genrePresets[index];
        return Card(
          color: StudioTheme.card,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ExpansionTile(
            leading: Text(g.icon, style: const TextStyle(fontSize: 28)),
            title: Row(children: [
              Text(g.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: StudioTheme.blue.withAlpha(30), borderRadius: BorderRadius.circular(6)),
                child: Text('${g.targetLufs} LUFS', style: TextStyle(color: StudioTheme.blue, fontSize: 11)),
              ),
            ]),
            subtitle: Text(g.description, style: const TextStyle(color: Colors.white54, fontSize: 12)),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  children: g.tips.entries.map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      SizedBox(width: 70, child: Text(e.key, style: TextStyle(color: StudioTheme.teal, fontWeight: FontWeight.bold, fontSize: 13))),
                      Expanded(child: Text(e.value, style: const TextStyle(color: Colors.white60, fontSize: 12))),
                    ]),
                  )).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
