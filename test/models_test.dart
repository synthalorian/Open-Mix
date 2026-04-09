import 'package:flutter_test/flutter_test.dart';
import 'package:open_mix/models/mix_models.dart';
import 'package:open_mix/data/loudness_targets.dart';
import 'package:open_mix/data/frequency_bands.dart';
import 'package:open_mix/data/default_checklist.dart';
import 'package:open_mix/data/genre_presets.dart';

void main() {
  test('loudness targets has entries', () {
    expect(loudnessTargets.length, greaterThan(5));
    expect(loudnessTargets.first.platform, 'Spotify');
  });

  test('frequency bands cover full spectrum', () {
    expect(frequencyBands.first.lowHz, 20);
    expect(frequencyBands.last.highHz, 20000);
  });

  test('frequency band range label formats correctly', () {
    expect(frequencyBands.first.rangeLabel, '20–60Hz');
    expect(frequencyBands.last.rangeLabel, '6k–20kHz');
  });

  test('default checklist has items', () {
    final list = defaultChecklist();
    expect(list.length, greaterThan(10));
    expect(list.first.title, 'Gain Staging');
  });

  test('MixCheckItem round-trips JSON', () {
    final item = MixCheckItem(id: '1', title: 'Test', description: 'Desc', order: 0, isChecked: true);
    final json = item.toJson();
    final restored = MixCheckItem.fromJson(json);
    expect(restored.title, 'Test');
    expect(restored.isChecked, true);
  });

  test('MixSession round-trips JSON', () {
    final s = MixSession(id: '1', name: 'My Mix', createdAt: DateTime(2026), notes: 'test');
    final json = s.toJson();
    final restored = MixSession.fromJson(json);
    expect(restored.name, 'My Mix');
    expect(restored.notes, 'test');
  });

  test('genre presets have tips', () {
    for (final g in genrePresets) {
      expect(g.tips.isNotEmpty, true, reason: '${g.name} should have tips');
    }
  });
}
