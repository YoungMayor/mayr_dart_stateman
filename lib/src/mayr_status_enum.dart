enum MayrStatus { empty, error, idle, loading, success, updating }

extension MayrStatusEmoji on MayrStatus {
  /// Get a status's emoji
  String get emoji => switch (this) {
    MayrStatus.empty => '📭', // Empty mailbox
    MayrStatus.error => '❌', // Red cross
    MayrStatus.idle => '⏸️', // Pause button
    MayrStatus.loading => '⏳', // Hourglass
    MayrStatus.success => '✅', // Green checkmark
    MayrStatus.updating => '🔄', // Refresh arrow
  };
}
