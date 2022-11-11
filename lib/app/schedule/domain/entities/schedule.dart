import 'dart:convert';

import 'package:mi_learning/app/schedule/domain/entities/schedule_color.dart';
import 'package:mi_learning/app/schedule/domain/entities/schedule_status.dart';
import 'package:mi_learning/utils/date_time_helper.dart';

class Schedule {
  final String id;
  final String title;
  final String note;
  final DateTime dueDate;
  final String location;
  final ScheduleColor color;
  final ScheduleStatus status;

  Schedule({
    required this.id,
    required this.title,
    required this.note,
    required this.dueDate,
    required this.location,
    required this.color,
    required this.status,
  });

  Schedule copyWith({
    String? id,
    String? title,
    String? note,
    DateTime? dueDate,
    String? location,
    ScheduleColor? color,
    ScheduleStatus? status,
  }) {
    return Schedule(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      dueDate: dueDate ?? this.dueDate,
      location: location ?? this.location,
      color: color ?? this.color,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'note': note,
      'dueDate': dueDate.millisecondsSinceEpoch,
      'location': location,
      'color': color.name,
      'status': status.name,
    };
  }

  factory Schedule.fromMap(Map<String, dynamic> map) {
    return Schedule(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      note: map['note'] ?? '',
      dueDate: DateTimeHelper.dateTimeFromServerDateTimeResponse(
        (map['dueDate'] as List<dynamic>).cast<int>(),
      ),
      location: map['location'] ?? '',
      color: ScheduleColor.values.firstWhere(
        (element) => element.name == map['color'],
      ),
      status: ScheduleStatus.values.firstWhere(
        (element) => element.name == map['status'],
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Schedule.fromJson(String source) =>
      Schedule.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Schedule(id: $id, title: $title, note: $note, dueDate: $dueDate, location: $location, color: $color, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Schedule &&
        other.id == id &&
        other.title == title &&
        other.note == note &&
        other.dueDate == dueDate &&
        other.location == location &&
        other.color == color &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        note.hashCode ^
        dueDate.hashCode ^
        location.hashCode ^
        color.hashCode ^
        status.hashCode;
  }
}
