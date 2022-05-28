import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mi_learning/app/common/domain/entity/rating.dart';

class CourseRating {
  final double average;
  final List<int> ratingAverageByStar;
  final List<Rating> ratings;
  CourseRating({
    required this.average,
    required this.ratingAverageByStar,
    required this.ratings,
  });

  CourseRating copyWith({
    double? average,
    List<int>? ratingAverageByStar,
    List<Rating>? ratings,
  }) {
    return CourseRating(
      average: average ?? this.average,
      ratingAverageByStar: ratingAverageByStar ?? this.ratingAverageByStar,
      ratings: ratings ?? this.ratings,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'average': average,
      'ratingAverageByStar': ratingAverageByStar,
      'ratings': ratings.map((x) => x.toMap()).toList(),
    };
  }

  factory CourseRating.fromMap(Map<String, dynamic> map) {
    return CourseRating(
      average: map['average']?.toDouble() ?? 0.0,
      ratingAverageByStar: List<int>.from(map['ratingAverageByStar']),
      ratings: List<Rating>.from(map['ratings']?.map((x) => Rating.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseRating.fromJson(String source) =>
      CourseRating.fromMap(json.decode(source));

  @override
  String toString() =>
      'CourseRating(average: $average, ratingAverageByStar: $ratingAverageByStar, ratings: $ratings)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CourseRating &&
        other.average == average &&
        listEquals(other.ratingAverageByStar, ratingAverageByStar) &&
        listEquals(other.ratings, ratings);
  }

  @override
  int get hashCode =>
      average.hashCode ^ ratingAverageByStar.hashCode ^ ratings.hashCode;
}
