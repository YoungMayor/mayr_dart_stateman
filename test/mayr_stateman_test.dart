import 'package:mayr_stateman/mayr_stateman.dart';
import 'package:test/test.dart';

void main() {
  group('MayrStateman Core Tests', () {
    late MayrStateman<String> state;

    setUp(() {
      state = MayrStateman.init();
    });

    test('Initial state should be idle with null message and payload', () {
      expect(state.isIdle, isTrue);
      expect(state.message, isNull);
      expect(state.payload, isNull);
      expect(state.statusName, equals('idle'));
    });

    test('setMessage should update message', () {
      const testMessage = 'Test message';
      state.setMessage(testMessage);
      expect(state.message, equals(testMessage));
    });

    test('setPayload should update payload', () {
      const testPayload = 'Test payload';
      state.setPayload(testPayload);
      expect(state.payload, equals(testPayload));
    });

    test('setErrorWithMessage should set status to error with message', () {
      const errorMessage = 'Error occurred';
      state.setErrorWithMessage(errorMessage);
      expect(state.isError, isTrue);
      expect(state.message, equals(errorMessage));
    });

    test('setSuccessWithPayload should set status to success with payload', () {
      const testPayload = 'Success payload';
      state.setSuccessWithPayload(testPayload);
      expect(state.isSuccess, isTrue);
      expect(state.payload, equals(testPayload));
      expect(state.isSuccessWithPayload, isTrue);
    });

    test('reset should clear status, message, and payload', () {
      state.setSuccessWithPayload('data').setMessage('message');
      expect(state.isSuccess, isTrue);
      expect(state.payload, isNotNull);
      expect(state.message, isNotNull);

      state.reset();
      expect(state.isIdle, isTrue);
      expect(state.payload, isNull);
      expect(state.message, isNull);
    });

    test('isProcessing should return true for loading state', () {
      state.setStatusLoading();
      expect(state.isProcessing, isTrue);
    });

    test('isProcessing should return true for updating state', () {
      state.setStatusUpdating();
      expect(state.isProcessing, isTrue);
    });

    test('isProcessing should return false for idle state', () {
      state.setStatusIdle();
      expect(state.isProcessing, isFalse);
    });

    test('hasValidPayload should return true when payload type matches', () {
      state.setPayload('test');
      expect(state.hasValidPayload, isTrue);
    });

    test('Method chaining should work correctly', () {
      state
          .setStatusLoading()
          .setMessage('Loading...')
          .setPayload('data')
          .setStatusSuccess();

      expect(state.isSuccess, isTrue);
      expect(state.message, equals('Loading...'));
      expect(state.payload, equals('data'));
    });

    test('Status emojis should be accessible', () {
      state.setStatusIdle();
      expect(state.statusEmoji, equals('⏸️'));

      state.setStatusLoading();
      expect(state.statusEmoji, equals('⏳'));

      state.setStatusSuccess();
      expect(state.statusEmoji, equals('✅'));

      state.setStatusError();
      expect(state.statusEmoji, equals('❌'));

      state.setStatusUpdating();
      expect(state.statusEmoji, equals('🔄'));

      state.setStatusEmpty();
      expect(state.statusEmoji, equals('📭'));
    });
  });

  group('MayrStateman Type Safety Tests', () {
    test('String type payload', () {
      final state = MayrStateman<String>.init();
      state.setPayload('test string');
      expect(state.payload, equals('test string'));
    });

    test('int type payload', () {
      final state = MayrStateman<int>.init();
      state.setPayload(42);
      expect(state.payload, equals(42));
    });

    test('bool type payload', () {
      final state = MayrStateman<bool>.init();
      state.setPayload(true);
      expect(state.payload, isTrue);
    });

    test('List type payload', () {
      final state = MayrStateman<List<int>>.init();
      final list = [1, 2, 3];
      state.setPayload(list);
      expect(state.payload, equals(list));
    });

    test('Map type payload', () {
      final state = MayrStateman<Map<String, dynamic>>.init();
      final map = {'key': 'value', 'count': 42};
      state.setPayload(map);
      expect(state.payload, equals(map));
    });
  });

  group('MayrStatus Enum Tests', () {
    test('MayrStatus should have all expected values', () {
      expect(MayrStatus.values.length, equals(6));
      expect(MayrStatus.values, contains(MayrStatus.empty));
      expect(MayrStatus.values, contains(MayrStatus.error));
      expect(MayrStatus.values, contains(MayrStatus.idle));
      expect(MayrStatus.values, contains(MayrStatus.loading));
      expect(MayrStatus.values, contains(MayrStatus.success));
      expect(MayrStatus.values, contains(MayrStatus.updating));
    });

    test('MayrStatus emoji extension should work', () {
      expect(MayrStatus.empty.emoji, equals('📭'));
      expect(MayrStatus.error.emoji, equals('❌'));
      expect(MayrStatus.idle.emoji, equals('⏸️'));
      expect(MayrStatus.loading.emoji, equals('⏳'));
      expect(MayrStatus.success.emoji, equals('✅'));
      expect(MayrStatus.updating.emoji, equals('🔄'));
    });

    test('MayrStatus name should match enum value name', () {
      expect(MayrStatus.empty.name, equals('empty'));
      expect(MayrStatus.error.name, equals('error'));
      expect(MayrStatus.idle.name, equals('idle'));
      expect(MayrStatus.loading.name, equals('loading'));
      expect(MayrStatus.success.name, equals('success'));
      expect(MayrStatus.updating.name, equals('updating'));
    });
  });
}
