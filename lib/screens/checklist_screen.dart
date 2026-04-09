import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/mix_providers.dart';
import '../theme/studio_theme.dart';

class ChecklistScreen extends ConsumerWidget {
  const ChecklistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(checklistProvider);
    final notifier = ref.read(checklistProvider.notifier);
    final checked = items.where((e) => e.isChecked).length;

    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(16),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('$checked / ${items.length} complete', style: TextStyle(color: StudioTheme.teal, fontWeight: FontWeight.bold)),
          TextButton(onPressed: notifier.resetAll, child: const Text('Reset')),
        ]),
      ),
      if (items.isNotEmpty)
        LinearProgressIndicator(
          value: items.isEmpty ? 0 : checked / items.length,
          backgroundColor: StudioTheme.surface,
          valueColor: AlwaysStoppedAnimation(StudioTheme.teal),
          minHeight: 4,
        ),
      Expanded(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              color: StudioTheme.card,
              margin: const EdgeInsets.only(bottom: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: CheckboxListTile(
                value: item.isChecked,
                onChanged: (_) => notifier.toggle(item.id),
                title: Text(item.title, style: TextStyle(
                  color: item.isChecked ? Colors.white38 : Colors.white,
                  decoration: item.isChecked ? TextDecoration.lineThrough : null,
                )),
                subtitle: Text(item.description, style: const TextStyle(color: Colors.white30, fontSize: 12)),
              ),
            );
          },
        ),
      ),
    ]);
  }
}
