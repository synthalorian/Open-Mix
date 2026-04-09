import '../models/mix_models.dart';

const loudnessTargets = [
  LoudnessTarget(platform: 'Spotify', lufs: -14, description: 'Normalization target. Songs louder than -14 get turned down.', icon: '🟢'),
  LoudnessTarget(platform: 'Apple Music', lufs: -16, description: 'Sound Check normalization. More conservative than Spotify.', icon: '🍎'),
  LoudnessTarget(platform: 'YouTube', lufs: -14, description: 'Similar to Spotify. Loudness penalty above -14.', icon: '🔴'),
  LoudnessTarget(platform: 'Amazon Music', lufs: -14, description: 'Standard streaming target.', icon: '📦'),
  LoudnessTarget(platform: 'Tidal', lufs: -14, description: 'Hi-fi streaming, same loudness target.', icon: '🌊'),
  LoudnessTarget(platform: 'CD Master', lufs: -9, description: 'Traditional CD loudness. Louder than streaming targets.', icon: '💿'),
  LoudnessTarget(platform: 'Broadcast (EBU R128)', lufs: -23, description: 'European broadcast standard. Very dynamic.', icon: '📡'),
  LoudnessTarget(platform: 'Vinyl', lufs: -12, description: 'Vinyl mastering. Needs dynamic range for groove cutting.', icon: '📀'),
  LoudnessTarget(platform: 'Podcast', lufs: -16, description: 'Standard podcast loudness. Match Apple/Spotify specs.', icon: '🎙️'),
];
