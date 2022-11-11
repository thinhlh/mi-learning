import 'dart:convert';

import 'package:mi_learning/base/domain/usecase/params.dart';

class Feedback implements Params {
  final String content;
  final int rating;
  Feedback({
    required this.content,
    required this.rating,
  });

  Feedback copyWith({
    String? content,
    int? rating,
  }) {
    return Feedback(
      content: content ?? this.content,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'rating': rating,
    };
  }

  factory Feedback.fromMap(Map<String, dynamic> map) {
    return Feedback(
      content: map['content'] ?? '',
      rating: map['rating']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Feedback.fromJson(String source) =>
      Feedback.fromMap(json.decode(source));

  @override
  String toString() => 'Feedback(content: $content, rating: $rating)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Feedback &&
        other.content == content &&
        other.rating == rating;
  }

  @override
  int get hashCode => content.hashCode ^ rating.hashCode;
}
