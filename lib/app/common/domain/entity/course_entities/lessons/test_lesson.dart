import 'dart:convert';

class TestLesson {
  final String question;
  TestLesson({
    required this.question,
  });

  TestLesson copyWith({
    String? question,
  }) {
    return TestLesson(
      question: question ?? this.question,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'question': question,
    };
  }

  factory TestLesson.fromMap(Map<String, dynamic> map) {
    return TestLesson(
      question: map['question'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TestLesson.fromJson(String source) =>
      TestLesson.fromMap(json.decode(source));

  @override
  String toString() => 'TestLesson(question: $question)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TestLesson && other.question == question;
  }

  @override
  int get hashCode => question.hashCode;
}
