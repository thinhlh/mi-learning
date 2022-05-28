import 'dart:convert';

class RecommendedCourse {
  final String id;
  final String background;
  final String title;
  final double rating;
  final double price;
  final String category;
  final String teacherName;
  RecommendedCourse({
    required this.id,
    required this.background,
    required this.title,
    required this.rating,
    required this.price,
    required this.category,
    required this.teacherName,
  });

  RecommendedCourse copyWith({
    String? id,
    String? background,
    String? title,
    double? rating,
    double? price,
    String? category,
    String? teacherName,
  }) {
    return RecommendedCourse(
      id: id ?? this.id,
      background: background ?? this.background,
      title: title ?? this.title,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      category: category ?? this.category,
      teacherName: teacherName ?? this.teacherName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'background': background,
      'title': title,
      'rating': rating,
      'price': price,
      'category': category,
      'teacherName': teacherName,
    };
  }

  factory RecommendedCourse.fromMap(Map<String, dynamic> map) {
    return RecommendedCourse(
      id: map['id'] ?? '',
      background: map['background'] ?? '',
      title: map['title'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
      price: map['price']?.toDouble() ?? 0.0,
      category: map['category'] ?? '',
      teacherName: map['teacherName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RecommendedCourse.fromJson(String source) =>
      RecommendedCourse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RecommendedCourse(id: $id, background: $background, title: $title, rating: $rating, price: $price, category: $category, teacherName: $teacherName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RecommendedCourse &&
        other.id == id &&
        other.background == background &&
        other.title == title &&
        other.rating == rating &&
        other.price == price &&
        other.category == category &&
        other.teacherName == teacherName;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        background.hashCode ^
        title.hashCode ^
        rating.hashCode ^
        price.hashCode ^
        category.hashCode ^
        teacherName.hashCode;
  }
}
