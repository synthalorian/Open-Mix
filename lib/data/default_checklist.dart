import '../models/mix_models.dart';

List<MixCheckItem> defaultChecklist() => [
  MixCheckItem(id: '1', title: 'Gain Staging', description: 'Set all faders to unity, trim inputs to -18dBFS average', order: 0),
  MixCheckItem(id: '2', title: 'Panning', description: 'Create stereo image. Spread instruments across the field.', order: 1),
  MixCheckItem(id: '3', title: 'High-Pass Filters', description: 'HPF everything that doesn\'t need low end.', order: 2),
  MixCheckItem(id: '4', title: 'Subtractive EQ', description: 'Cut problem frequencies before boosting.', order: 3),
  MixCheckItem(id: '5', title: 'Compression', description: 'Control dynamics. 2-4dB gain reduction on most sources.', order: 4),
  MixCheckItem(id: '6', title: 'Additive EQ', description: 'Gentle boosts for tone shaping after cuts.', order: 5),
  MixCheckItem(id: '7', title: 'Reverb & Space', description: 'Add depth and space. Use sends, not inserts.', order: 6),
  MixCheckItem(id: '8', title: 'Delay', description: 'Add movement and width. Sync to tempo.', order: 7),
  MixCheckItem(id: '9', title: 'Automation', description: 'Ride vocals, build energy, create movement.', order: 8),
  MixCheckItem(id: '10', title: 'Bus Processing', description: 'Glue compression on drum bus, instrument groups.', order: 9),
  MixCheckItem(id: '11', title: 'Reference Check', description: 'A/B against reference tracks. Check translation.', order: 10),
  MixCheckItem(id: '12', title: 'Mono Check', description: 'Check mix in mono for phase issues.', order: 11),
  MixCheckItem(id: '13', title: 'Low Volume Check', description: 'Listen quietly. Can you hear vocals and kick?', order: 12),
  MixCheckItem(id: '14', title: 'Limiting', description: 'Final limiter. Target platform LUFS. Max -1dBTP.', order: 13),
  MixCheckItem(id: '15', title: 'Fresh Ears', description: 'Take a break. Come back and listen again.', order: 14),
];
