import 'dart:convert';

class Category {
  final String id;
  final String title;
  final String background;
  final DateTime? deletedAt;
  Category({
    required this.id,
    required this.title,
    required this.background,
    this.deletedAt,
  });

  Category copyWith({
    String? id,
    String? title,
    String? background,
    DateTime? deletedAt,
  }) {
    return Category(
      id: id ?? this.id,
      title: title ?? this.title,
      background: background ?? this.background,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'background': background,
      'deletedAt': deletedAt?.millisecondsSinceEpoch,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      background: map['background'] ?? '',
      deletedAt: map['deletedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['deletedAt'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Category(id: $id, title: $title, background: $background, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
        other.id == id &&
        other.title == title &&
        other.background == background &&
        other.deletedAt == deletedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        background.hashCode ^
        deletedAt.hashCode;
  }
}
