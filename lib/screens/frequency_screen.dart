import 'package:flutter/material.dart';
import '../data/frequency_bands.dart';
import '../theme/studio_theme.dart';

class FrequencyScreen extends StatelessWidget {
  const FrequencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: frequencyBands.length,
      itemBuilder: (context, index) {
        final b = frequencyBands[index];
        final bandColor = HSLColor.fromAHSL(1, b.color, 0.7, 0.6).toColor();
        return Card(
          color: StudioTheme.card,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ExpansionTile(
            leading: Container(width: 6, height: 40, decoration: BoxDecoration(color: bandColor, borderRadius: BorderRadius.circular(3))),
            title: Row(children: [
              Text(b.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(width: 8),
              Text(b.rangeLabel, style: TextStyle(color: bandColor, fontSize: 12)),
            ]),
            subtitle: Text(b.description, style: const TextStyle(color: Colors.white54, fontSize: 12)),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: bandColor.withAlpha(20), borderRadius: BorderRadius.circular(8)),
                  child: Row(children: [
                    Icon(Icons.lightbulb_outline, color: bandColor, size: 18),
                    const SizedBox(width: 8),
                    Expanded(child: Text(b.eqTips, style: TextStyle(color: bandColor, fontSize: 13))),
                  ]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
