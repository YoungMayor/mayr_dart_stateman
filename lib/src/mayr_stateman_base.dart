import 'package:mayr_stateman/src/mayr_status_enum.dart';

/// A lightweight state management class for Dart applications.
///
/// [MayrStateman] provides a simple and intuitive way to manage state with
/// support for different statuses (idle, loading, success, error, updating, empty),
/// optional messages, and type-safe payloads.
///
/// Type parameter [PayloadT] defines the type of data this state manager will handle.
///
/// Example:
/// ```dart
/// final state = MayrStateman<String>.init();
/// state.setStatusLoading();
/// // Perform async operation
/// state.setSuccessWithPayload('Data loaded');
/// ```
class MayrStateman<PayloadT> {
  /// Optional message associated with the current state
  String? _message;

  /// Current status of the state
  MayrStatus _status;

  /// Optional payload data of type [PayloadT]
  PayloadT? _payload;

  /// Creates a new [MayrStateman] instance with initial idle status.
  MayrStateman.init() : _status = MayrStatus.idle;

  /// Check if the stateman has a valid payload
  ///
  /// Returns `true` if a payload is set and its type matches [PayloadT].
  bool get hasValidPayload => _payload.runtimeType == PayloadT;

  /// Check if status is empty
  ///
  /// Returns `true` if the current status is [MayrStatus.empty].
  bool get isEmpty => _status == MayrStatus.empty;

  /// Check if status is error
  ///
  /// Returns `true` if the current status is [MayrStatus.error].
  bool get isError => _status == MayrStatus.error;

  /// Check if status is idle
  ///
  /// Returns `true` if the current status is [MayrStatus.idle].
  bool get isIdle => _status == MayrStatus.idle;

  /// Check if status is loading
  ///
  /// Returns `true` if the current status is [MayrStatus.loading].
  bool get isLoading => _status == MayrStatus.loading;

  /// Check if the status is processing. That is it is either loading or updating
  ///
  /// Returns `true` if the current status is either [MayrStatus.loading] or [MayrStatus.updating].
  /// Useful for showing loading indicators during async operations.
  bool get isProcessing => isLoading || isUpdating;

  /// Check if status is success
  ///
  /// Returns `true` if the current status is [MayrStatus.success].
  bool get isSuccess => _status == MayrStatus.success;

  /// Check if status is success and has a valid payload
  ///
  /// Returns `true` if the current status is [MayrStatus.success] and
  /// a valid payload of type [PayloadT] is present.
  bool get isSuccessWithPayload => isSuccess && hasValidPayload;

  /// Check if status is updating
  ///
  /// Returns `true` if the current status is [MayrStatus.updating].
  bool get isUpdating => _status == MayrStatus.updating;

  /// Get message.
  ///
  /// Returns the currently set message, or `null` if no message is set.
  String? get message => _message;

  /// Get payload
  ///
  /// Returns the currently set payload of type [PayloadT], or `null` if no payload is set.
  PayloadT? get payload => _payload;

  /// Get the current status
  ///
  /// Returns the current [MayrStatus] enum value.
  MayrStatus get status => _status;

  /// Get the readable name of the status.
  ///
  /// Returns the string name of the current status (e.g., 'idle', 'loading', 'success').
  String get statusName => _status.name;

  /// Get the status's emoji
  ///
  /// Returns an emoji representation of the current status for visual feedback.
  String get statusEmoji => _status.emoji;

  /// Reset the state
  ///
  /// Resets the state to idle, clears the message, and removes the payload.
  /// Returns `this` for method chaining.
  MayrStateman reset() =>
      setStatusIdle()._updateMessage(null)._updatePayload(null);

  /// Set the status to error with an error message
  ///
  /// Convenience method to set both error status and an error message in one call.
  /// Returns `this` for method chaining.
  MayrStateman setErrorWithMessage(String message) =>
      _updateStatus(MayrStatus.error)._updateMessage(message);

  /// Set the message
  ///
  /// Updates the message associated with the current state.
  /// Returns `this` for method chaining.
  MayrStateman setMessage(String message) => _updateMessage(message);

  /// Set the Payload.
  ///
  /// Updates the payload data of type [PayloadT].
  /// Returns `this` for method chaining.
  MayrStateman setPayload(PayloadT payload) => _updatePayload(payload);

  /// Helper for setting status to empty
  ///
  /// Sets the current status to [MayrStatus.empty].
  /// Returns `this` for method chaining.
  MayrStateman setStatusEmpty() => _updateStatus(MayrStatus.empty);

  /// Helper for setting status to error
  ///
  /// Sets the current status to [MayrStatus.error].
  /// Returns `this` for method chaining.
  MayrStateman setStatusError() => _updateStatus(MayrStatus.error);

  /// Helper for setting status to idle
  ///
  /// Sets the current status to [MayrStatus.idle].
  /// Returns `this` for method chaining.
  MayrStateman setStatusIdle() => _updateStatus(MayrStatus.idle);

  /// Helper for setting status to loading
  ///
  /// Sets the current status to [MayrStatus.loading].
  /// Returns `this` for method chaining.
  MayrStateman setStatusLoading() => _updateStatus(MayrStatus.loading);

  /// Helper for setting status to success
  ///
  /// Sets the current status to [MayrStatus.success].
  /// Returns `this` for method chaining.
  MayrStateman setStatusSuccess() => _updateStatus(MayrStatus.success);

  /// Helper for setting status to updating
  ///
  /// Sets the current status to [MayrStatus.updating].
  /// Returns `this` for method chaining.
  MayrStateman setStatusUpdating() => _updateStatus(MayrStatus.updating);

  /// Set the status to success with a valid payload
  ///
  /// Convenience method to set both payload and success status in one call.
  /// Returns `this` for method chaining.
  MayrStateman setSuccessWithPayload(PayloadT payload) =>
      _updatePayload(payload)._updateStatus(MayrStatus.success);

  /// Internal method to update the message.
  /// Returns `this` to enable method chaining.
  MayrStateman _updateMessage(String? message) => this.._message = message;

  /// Internal method to update the payload.
  /// Returns `this` to enable method chaining.
  MayrStateman _updatePayload(PayloadT? payload) => this.._payload = payload;

  /// Internal method to update the status.
  /// Returns `this` to enable method chaining.
  MayrStateman _updateStatus(MayrStatus status) => this.._status = status;
}
