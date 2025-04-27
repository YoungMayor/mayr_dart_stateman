import 'package:faker/faker.dart';

class SampleObject {
  final String id;
  final String content;
  final List<String> notes;

  SampleObject({required this.id, required this.content, required this.notes});

  factory SampleObject.fake() {
    return SampleObject(
      id: faker.guid.guid(),
      content: faker.lorem.sentence(),
      notes: faker.lorem.sentences(3),
    );
  }
}
