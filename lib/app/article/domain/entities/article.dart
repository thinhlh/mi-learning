// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mi_learning/app/common/domain/entity/category.dart';

class Article {
  final String id;
  final String author;
  final String title;
  final String thumbnail;
  final DateTime createdAt;
  final DateTime? deletedAt;
  final String url;
  final Category category;
  Article({
    required this.id,
    required this.author,
    required this.title,
    required this.thumbnail,
    required this.createdAt,
    this.deletedAt,
    required this.url,
    required this.category,
  });

  Article copyWith({
    String? id,
    String? author,
    String? title,
    String? thumbnail,
    DateTime? createdAt,
    DateTime? deletedAt,
    String? url,
    Category? category,
  }) {
    return Article(
      id: id ?? this.id,
      author: author ?? this.author,
      title: title ?? this.title,
      thumbnail: thumbnail ?? this.thumbnail,
      createdAt: createdAt ?? this.createdAt,
      deletedAt: deletedAt ?? this.deletedAt,
      url: url ?? this.url,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'author': author,
      'title': title,
      'thumbnail': thumbnail,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'deletedAt': deletedAt?.millisecondsSinceEpoch,
      'url': url,
      'category': category.toMap(),
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      id: map['id'] as String,
      author: map['author'] as String,
      title: map['title'] as String,
      thumbnail: map['thumbnail'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      deletedAt: map['deletedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['deletedAt'] as int)
          : null,
      url: map['url'] as String,
      category: Category.fromMap(map['category'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Article(id: $id, author: $author, title: $title, thumbnail: $thumbnail, createdAt: $createdAt, deletedAt: $deletedAt, url: $url, category: $category)';
  }

  @override
  bool operator ==(covariant Article other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.author == author &&
        other.title == title &&
        other.thumbnail == thumbnail &&
        other.createdAt == createdAt &&
        other.deletedAt == deletedAt &&
        other.url == url &&
        other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        author.hashCode ^
        title.hashCode ^
        thumbnail.hashCode ^
        createdAt.hashCode ^
        deletedAt.hashCode ^
        url.hashCode ^
        category.hashCode;
  }
}
