/// ## 🚦 MayrStateman
/// A lightweight, flexible state manager for Dart applications.
///
/// `mayr_stateman` simplifies state handling with a focus on clarity, expressiveness, and ease of use.
/// Easily track statuses like loading, success, error, and more — with support for payloads and messages.
///
///
/// ### Features
/// - Clean and expressive API
/// - Status tracking: idle, loading, success, error, etc.
/// - Optional payload and message management
///
/// ### Usage
/// ```dart
/// final state = MayrStateman<String>.init();
/// state.setStatusLoading();
/// state.setSuccessWithPayload('Data loaded');
/// print(state.isSuccess); // true
/// print(state.payload);   // Data loaded
/// ```
///
/// For more examples and full documentation, check the README.
///
/// Made with ❤️ by Young Mayor.
library;

export './src/mayr_stateman_base.dart';
export './src/mayr_status_enum.dart';
