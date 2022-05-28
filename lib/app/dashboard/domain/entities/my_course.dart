import 'dart:convert';

class MyCourse {
  final String id;
  final String title;
  final String background;
  final String? icon;
  final int lessonsFinished;
  final int totalLesson;
  final String currentLessonTitle;
  MyCourse({
    required this.id,
    required this.title,
    required this.background,
    this.icon,
    required this.lessonsFinished,
    required this.totalLesson,
    required this.currentLessonTitle,
  });

  MyCourse copyWith({
    String? id,
    String? title,
    String? background,
    String? icon,
    int? lessonsFinished,
    int? totalLesson,
    String? currentLessonTitle,
  }) {
    return MyCourse(
      id: id ?? this.id,
      title: title ?? this.title,
      background: background ?? this.background,
      icon: icon ?? this.icon,
      lessonsFinished: lessonsFinished ?? this.lessonsFinished,
      totalLesson: totalLesson ?? this.totalLesson,
      currentLessonTitle: currentLessonTitle ?? this.currentLessonTitle,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'background': background,
      'icon': icon,
      'lessonsFinished': lessonsFinished,
      'totalLesson': totalLesson,
      'currentLessonTitle': currentLessonTitle,
    };
  }

  factory MyCourse.fromMap(Map<String, dynamic> map) {
    return MyCourse(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      background: map['background'] ?? '',
      icon: map['icon'],
      lessonsFinished: map['lessonsFinished']?.toInt() ?? 0,
      totalLesson: map['totalLesson']?.toInt() ?? 0,
      currentLessonTitle: map['currentLessonTitle'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MyCourse.fromJson(String source) =>
      MyCourse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MyCourse(id: $id, title: $title, background: $background, icon: $icon, lessonsFinished: $lessonsFinished, totalLesson: $totalLesson, currentLessonTitle: $currentLessonTitle)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MyCourse &&
        other.id == id &&
        other.title == title &&
        other.background == background &&
        other.icon == icon &&
        other.lessonsFinished == lessonsFinished &&
        other.totalLesson == totalLesson &&
        other.currentLessonTitle == currentLessonTitle;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        background.hashCode ^
        icon.hashCode ^
        lessonsFinished.hashCode ^
        totalLesson.hashCode ^
        currentLessonTitle.hashCode;
  }
}
