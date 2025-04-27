import 'package:mayr_stateman/mayr_stateman.dart';

String message = "";
dynamic payload = "";

void quickUse() {
  MayrStateman state = MayrStateman<int>.init();

  state.setStatusLoading();
  print(state.statusName); // loading
  print(state.statusEmoji); // ⏳

  state.setSuccessWithPayload(42);
  print(state.payload); // 42
}

void setters() {
  MayrStateman state = MayrStateman.init();

  state.setErrorWithMessage(message); // - Sets the status to error with message
  state.setSuccessWithPayload(payload); // Set status to success with payload

  state.setStatusEmpty(); // ------------- Set the status to empty
  state.setStatusError(); // ------------- Set the status to error
  state.setStatusIdle(); // -------------- Set the status to idle
  state.setStatusLoading(); // ----------- Set the status to loading
  state.setStatusSuccess(); // ----------- Set the status to success
  state.setStatusUpdating(); // ---------- Set the status to updating

  state.setPayload(payload); // ---------- Set the payload
  state.setMessage(message); // ---------- Set the message

  // State can be reset
  state.reset();

  // Methods can be chained
  state.setMessage(message).setPayload(payload).setStatusSuccess();
}

void getters() {
  MayrStateman state = MayrStateman.init();

  state.hasValidPayload; // ---- Check that state has valid payload
  state.isSuccessWithPayload; // Check if status is success, and has payload

  state.isIdle; // --------- Check if status is idle
  state.isEmpty; // -------- Check if status is empty

  state.isError; // -------- Check if status is error

  state.isLoading; // ------ Check if status is loading
  state.isUpdating; // ----- Check if state is updating
  state.isProcessing; // --- Check if status is processing. loading or updating

  state.isSuccess; // ------ Check if status is success

  state.payload; // -------- Get the payload
  state.message; // -------- Get the message

  state.status; // --------- Get the status, instance of [MayrStatus]
  state.statusName; // ----- Get the status name
  state.statusEmoji; // ---- Get the status emoji
}
