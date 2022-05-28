import 'dart:convert';

class Lesson {
  final String id;
  final int? lessonOrder;

  Lesson({
    required this.id,
    this.lessonOrder,
  });

  Lesson copyWith({
    String? id,
    int? lessonOrder,
  }) {
    return Lesson(
      id: id ?? this.id,
      lessonOrder: lessonOrder ?? this.lessonOrder,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'lessonOrder': lessonOrder,
    };
  }

  factory Lesson.fromMap(Map<String, dynamic> map) {
    return Lesson(
      id: map['id'] ?? '',
      lessonOrder: map['lessonOrder']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Lesson.fromJson(String source) => Lesson.fromMap(json.decode(source));

  @override
  String toString() => 'Lesson(id: $id, lessonOrder: $lessonOrder)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Lesson &&
        other.id == id &&
        other.lessonOrder == lessonOrder;
  }

  @override
  int get hashCode => id.hashCode ^ lessonOrder.hashCode;
}
