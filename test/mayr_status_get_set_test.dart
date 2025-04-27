import 'package:test/test.dart';
import 'package:mayr_stateman/mayr_stateman.dart';

void main() {
  group('Mayr Stateman Status Tests', () {
    late MayrStateman<String> state;

    setUp(() {
      state = MayrStateman.init();
    });

    test('Initial status should be idle', () {
      expect(state.isIdle, isTrue);
      expect(state.statusName, equals(MayrStatus.idle.name));
    });

    test('setStatusLoading updates status to loading', () {
      state.setStatusLoading();
      expect(state.isLoading, isTrue);
      expect(state.statusName, equals(MayrStatus.loading.name));
    });

    test('setStatusSuccess updates status to success', () {
      state.setStatusSuccess();
      expect(state.isSuccess, isTrue);
      expect(state.statusName, equals(MayrStatus.success.name));
    });

    test('setStatusError updates status to error', () {
      state.setStatusError();
      expect(state.isError, isTrue);
      expect(state.statusName, equals(MayrStatus.error.name));
    });

    test('setStatusUpdating updates status to updating', () {
      state.setStatusUpdating();
      expect(state.isUpdating, isTrue);
      expect(state.statusName, equals(MayrStatus.updating.name));
    });

    test('setStatusEmpty updates status to empty', () {
      state.setStatusEmpty();
      expect(state.isEmpty, isTrue);
      expect(state.statusName, equals(MayrStatus.empty.name));
    });

    test('reset updates status to idle', () {
      state.reset();
      expect(state.isIdle, isTrue);
      expect(state.statusName, equals(MayrStatus.idle.name));
    });
  });
}
