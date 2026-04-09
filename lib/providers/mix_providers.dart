import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
import '../models/mix_models.dart';
import '../data/default_checklist.dart';

const _uuid = Uuid();

class ChecklistNotifier extends StateNotifier<List<MixCheckItem>> {
  final Box _box;
  ChecklistNotifier(this._box) : super([]) { _load(); }

  void _load() {
    final raw = _box.get('checklist') as String?;
    if (raw != null) {
      state = (jsonDecode(raw) as List).map((e) => MixCheckItem.fromJson(e as Map<String, dynamic>)).toList();
    } else {
      state = defaultChecklist();
      _save();
    }
  }

  void _save() => _box.put('checklist', jsonEncode(state.map((e) => e.toJson()).toList()));

  void toggle(String id) {
    state = state.map((e) => e.id == id ? e.copyWith(isChecked: !e.isChecked) : e).toList();
    _save();
  }

  void resetAll() {
    state = state.map((e) => e.copyWith(isChecked: false)).toList();
    _save();
  }

  int get checkedCount => state.where((e) => e.isChecked).length;
}

class SessionNotifier extends StateNotifier<List<MixSession>> {
  final Box _box;
  SessionNotifier(this._box) : super([]) { _load(); }

  void _load() {
    final raw = _box.get('sessions', defaultValue: '[]') as String;
    state = (jsonDecode(raw) as List).map((e) => MixSession.fromJson(e as Map<String, dynamic>)).toList();
  }
  void _save() => _box.put('sessions', jsonEncode(state.map((e) => e.toJson()).toList()));

  void addSession(String name) {
    state = [MixSession(id: _uuid.v4(), name: name, createdAt: DateTime.now()), ...state];
    _save();
  }

  void updateNotes(String id, String notes) {
    state = state.map((s) => s.id == id ? MixSession(id: s.id, name: s.name, createdAt: s.createdAt, notes: notes, referenceTracks: s.referenceTracks) : s).toList();
    _save();
  }

  void deleteSession(String id) {
    state = state.where((s) => s.id != id).toList();
    _save();
  }
}

final mixBoxProvider = FutureProvider<Box>((ref) => Hive.openBox('open_mix'));

final checklistProvider = StateNotifierProvider<ChecklistNotifier, List<MixCheckItem>>((ref) {
  final box = ref.watch(mixBoxProvider);
  return box.when(data: (b) => ChecklistNotifier(b), loading: () => ChecklistNotifier(Hive.box('open_mix')), error: (_, __) => ChecklistNotifier(Hive.box('open_mix')));
});

final sessionProvider = StateNotifierProvider<SessionNotifier, List<MixSession>>((ref) {
  final box = ref.watch(mixBoxProvider);
  return box.when(data: (b) => SessionNotifier(b), loading: () => SessionNotifier(Hive.box('open_mix')), error: (_, __) => SessionNotifier(Hive.box('open_mix')));
});

final selectedTabProvider = StateProvider<int>((ref) => 0);
