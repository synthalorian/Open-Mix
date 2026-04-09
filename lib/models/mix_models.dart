class LoudnessTarget {
  final String platform;
  final double lufs;
  final String description;
  final String icon;

  const LoudnessTarget({
    required this.platform,
    required this.lufs,
    required this.description,
    required this.icon,
  });
}

class FrequencyBand {
  final String name;
  final int lowHz;
  final int highHz;
  final String description;
  final String eqTips;
  final double color; // hue value

  const FrequencyBand({
    required this.name,
    required this.lowHz,
    required this.highHz,
    required this.description,
    required this.eqTips,
    required this.color,
  });

  String get rangeLabel {
    String fmt(int hz) => hz >= 1000 ? '${hz ~/ 1000}k' : '$hz';
    return '${fmt(lowHz)}–${fmt(highHz)}Hz';
  }
}

class MixCheckItem {
  final String id;
  final String title;
  final String description;
  final int order;
  bool isChecked;

  MixCheckItem({
    required this.id,
    required this.title,
    required this.description,
    required this.order,
    this.isChecked = false,
  });

  MixCheckItem copyWith({bool? isChecked}) => MixCheckItem(
    id: id, title: title, description: description, order: order,
    isChecked: isChecked ?? this.isChecked,
  );

  Map<String, dynamic> toJson() => {
    'id': id, 'title': title, 'description': description,
    'order': order, 'isChecked': isChecked,
  };

  factory MixCheckItem.fromJson(Map<String, dynamic> j) => MixCheckItem(
    id: j['id'] as String, title: j['title'] as String,
    description: j['description'] as String, order: j['order'] as int,
    isChecked: j['isChecked'] as bool? ?? false,
  );
}

class MixSession {
  final String id;
  final String name;
  final DateTime createdAt;
  final String notes;
  final List<String> referenceTracks;

  MixSession({
    required this.id,
    required this.name,
    required this.createdAt,
    this.notes = '',
    this.referenceTracks = const [],
  });

  Map<String, dynamic> toJson() => {
    'id': id, 'name': name, 'createdAt': createdAt.toIso8601String(),
    'notes': notes, 'referenceTracks': referenceTracks,
  };

  factory MixSession.fromJson(Map<String, dynamic> j) => MixSession(
    id: j['id'] as String, name: j['name'] as String,
    createdAt: DateTime.parse(j['createdAt'] as String),
    notes: j['notes'] as String? ?? '',
    referenceTracks: List<String>.from(j['referenceTracks'] as List? ?? []),
  );
}

class GenrePreset {
  final String name;
  final String icon;
  final double targetLufs;
  final String description;
  final Map<String, String> tips;

  const GenrePreset({
    required this.name,
    required this.icon,
    required this.targetLufs,
    required this.description,
    required this.tips,
  });
}
