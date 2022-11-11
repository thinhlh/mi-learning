import 'dart:convert';

class ScheduleDate {
  DateTime date;
  ScheduleDate({
    required this.date,
  });

  ScheduleDate copyWith({
    DateTime? date,
  }) {
    return ScheduleDate(
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory ScheduleDate.fromMap(Map<String, dynamic> map) {
    return ScheduleDate(
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ScheduleDate.fromJson(String source) =>
      ScheduleDate.fromMap(json.decode(source));

  @override
  String toString() => 'ScheduleDate(date: $date)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ScheduleDate && other.date == date;
  }

  @override
  int get hashCode => date.hashCode;
}
