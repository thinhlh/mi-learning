import 'dart:convert';

class VideoLesson {
  final String videoUrl;
  final int length;
  VideoLesson({
    required this.videoUrl,
    required this.length,
  });

  VideoLesson copyWith({
    String? videoUrl,
    int? length,
  }) {
    return VideoLesson(
      videoUrl: videoUrl ?? this.videoUrl,
      length: length ?? this.length,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'videoUrl': videoUrl,
      'length': length,
    };
  }

  factory VideoLesson.fromMap(Map<String, dynamic> map) {
    return VideoLesson(
      videoUrl: map['videoUrl'] ?? '',
      length: map['length']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoLesson.fromJson(String source) =>
      VideoLesson.fromMap(json.decode(source));

  @override
  String toString() => 'VideoLesson(videoUrl: $videoUrl, length: $length)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VideoLesson &&
        other.videoUrl == videoUrl &&
        other.length == length;
  }

  @override
  int get hashCode => videoUrl.hashCode ^ length.hashCode;
}
