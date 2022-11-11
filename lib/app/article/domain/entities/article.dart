import 'dart:convert';

import 'package:flutter/foundation.dart';

class Article {
  final String id;
  final String author;
  final String title;
  final String thumbnail;
  final List<int> createdDate;
  final String url;
  final String category;
  Article({
    required this.id,
    required this.author,
    required this.title,
    required this.thumbnail,
    required this.createdDate,
    required this.url,
    required this.category,
  });

  Article copyWith(
      {String? id,
      String? author,
      String? title,
      String? thumbnail,
      List<int>? createdDate,
      String? url,
      String? category}) {
    return Article(
      id: id ?? this.id,
      author: author ?? this.author,
      title: title ?? this.title,
      thumbnail: thumbnail ?? this.thumbnail,
      createdDate: createdDate ?? this.createdDate,
      url: url ?? this.url,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'author': author,
      'title': title,
      'thumbnail': thumbnail,
      'createdDate': createdDate,
      'url': url,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      id: map['id'] ?? '',
      author: map['author'] ?? '',
      title: map['title'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
      createdDate: List<int>.from(map['createdDate']),
      url: map['url'] ?? '',
      category: map['category'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Article(id: $id, author: $author, title: $title, thumbnail: $thumbnail, createdDate: $createdDate, url: $url, category: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Article &&
        other.id == id &&
        other.author == author &&
        other.title == title &&
        other.thumbnail == thumbnail &&
        listEquals(other.createdDate, createdDate) &&
        other.url == url &&
        other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        author.hashCode ^
        title.hashCode ^
        thumbnail.hashCode ^
        createdDate.hashCode ^
        url.hashCode ^
        category.hashCode;
  }
}
