import 'package:faker/faker.dart';
import 'package:mayr_stateman/mayr_stateman.dart';
import 'package:test/test.dart';

import 'objects/sample_object.dart';

void main() {
  group('Stateman payload tests', () {
    test('Test String payload', () => _testPayload(faker.guid.guid()));

    test(
      'Test int payload',
      () => _testPayload(faker.randomGenerator.integer(100000000)),
    );

    test(
      'Test bool payload',
      () => _testPayload(faker.randomGenerator.boolean()),
    );

    test('Test Object payload', () => _testPayload(SampleObject.fake()));

    test('Test String List payload', () {
      List<String> payload = List.generate(5, (index) => faker.guid.guid());

      _testPayload(payload);
    });

    test('Test Object List payload', () {
      List<SampleObject> payload = List.generate(5, (index) {
        return SampleObject.fake();
      });

      _testPayload(payload);
    });
  });
}

void _testPayload<PayloadT>(PayloadT payload) {
  print("Running payload test for: Type $PayloadT - Value: $payload");

  final state = MayrStateman<PayloadT>.init();

  expect(state.payload, isNull);

  state.setSuccessWithPayload(payload);
  expect(state.payload, equals(payload));
  expect(state.isSuccess, isTrue);

  state.reset();
  expect(state.payload, isNull);
  expect(state.message, isNull);

  state.setPayload(payload);
  expect(state.payload, equals(payload));
  expect(state.message, isNull);
}
