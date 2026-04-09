import 'package:flutter/material.dart';
import '../data/loudness_targets.dart';
import '../theme/studio_theme.dart';

class LoudnessScreen extends StatelessWidget {
  const LoudnessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: loudnessTargets.length,
      itemBuilder: (context, index) {
        final t = loudnessTargets[index];
        return Card(
          color: StudioTheme.card,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(children: [
              Text(t.icon, style: const TextStyle(fontSize: 28)),
              const SizedBox(width: 16),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(t.platform, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text(t.description, style: TextStyle(color: Colors.white54, fontSize: 12)),
              ])),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: StudioTheme.teal.withAlpha(30),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: StudioTheme.teal.withAlpha(80)),
                ),
                child: Text('${t.lufs} LUFS', style: TextStyle(color: StudioTheme.teal, fontWeight: FontWeight.bold, fontSize: 14)),
              ),
            ]),
          ),
        );
      },
    );
  }
}
