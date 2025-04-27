import 'package:mayr_stateman/src/mayr_status_enum.dart';

class MayrStateman<PayloadT> {
  String? _message;
  MayrStatus _status;
  PayloadT? _payload;

  MayrStateman.init() : _status = MayrStatus.idle;

  /// Check if the stateman has a valid payload
  bool get hasValidPayload => this._payload.runtimeType == PayloadT;

  /// Check if status is empty
  bool get isEmpty => this._status == MayrStatus.empty;

  /// Check if status is error
  bool get isError => this._status == MayrStatus.error;

  /// Check if status is idle
  bool get isIdle => this._status == MayrStatus.idle;

  /// Check if status is loading
  bool get isLoading => this._status == MayrStatus.loading;

  /// Check if the status is processing. That is it is either loading or updating
  bool get isProcessing => isLoading || isUpdating;

  /// Check if status is success
  bool get isSuccess => this._status == MayrStatus.success;

  /// Check if status is success and has a valid payload
  bool get isSuccessWithPayload => isSuccess && hasValidPayload;

  /// Check if status is updating
  bool get isUpdating => this._status == MayrStatus.updating;

  /// Get message.
  String? get message => this._message;

  /// Get payload
  PayloadT? get payload => this._payload;

  MayrStatus get status => this._status;

  /// Get the readable name of the status.
  String get statusName => this._status.name;

  /// Get the status's emoji
  String get statusEmoji => this._status.emoji;

  /// Reset the state
  MayrStateman reset() =>
      setStatusIdle()._updateMessage(null)._updatePayload(null);

  /// Set the status to error with an error message
  MayrStateman setErrorWithMessage(String message) =>
      _updateStatus(MayrStatus.error)._updateMessage(message);

  /// Set the message
  MayrStateman setMessage(String message) => _updateMessage(message);

  /// Set the Payload.
  MayrStateman setPayload(PayloadT payload) => _updatePayload(payload);

  /// Helper for setting status to empty
  MayrStateman setStatusEmpty() => _updateStatus(MayrStatus.empty);

  /// Helper for setting status to error
  MayrStateman setStatusError() => _updateStatus(MayrStatus.error);

  /// Helper for setting status to idle
  MayrStateman setStatusIdle() => _updateStatus(MayrStatus.idle);

  /// Helper for setting status to loading
  MayrStateman setStatusLoading() => _updateStatus(MayrStatus.loading);

  /// Helper for setting status to success
  MayrStateman setStatusSuccess() => _updateStatus(MayrStatus.success);

  /// Helper for setting status to updating
  MayrStateman setStatusUpdating() => _updateStatus(MayrStatus.updating);

  /// Set the status to success with a valid payload
  MayrStateman setSuccessWithPayload(PayloadT payload) =>
      _updatePayload(payload)._updateStatus(MayrStatus.success);

  MayrStateman _updateMessage(String? message) => this.._message = message;
  MayrStateman _updatePayload(PayloadT? payload) => this.._payload = payload;
  MayrStateman _updateStatus(MayrStatus status) => this.._status = status;
}
