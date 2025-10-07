/// Enumeration of possible state statuses.
///
/// Represents the different states an operation or component can be in.
enum MayrStatus {
  /// Indicates the state has no data or is empty
  empty,

  /// Indicates an error occurred during the operation
  error,

  /// Indicates the initial, inactive state
  idle,

  /// Indicates data is being loaded for the first time
  loading,

  /// Indicates the operation completed successfully
  success,

  /// Indicates existing data is being updated or refreshed
  updating,
}

/// Extension on [MayrStatus] to provide emoji representations.
///
/// Provides a visual representation of each status using emojis,
/// useful for debugging and UI feedback.
extension MayrStatusEmoji on MayrStatus {
  /// Get a status's emoji
  ///
  /// Returns an emoji that visually represents the current status.
  String get emoji => switch (this) {
    MayrStatus.empty => '📭', // Empty mailbox
    MayrStatus.error => '❌', // Red cross
    MayrStatus.idle => '⏸️', // Pause button
    MayrStatus.loading => '⏳', // Hourglass
    MayrStatus.success => '✅', // Green checkmark
    MayrStatus.updating => '🔄', // Refresh arrow
  };
}
