import '../../../di/main.di.dart';
import '../helpers/date_time_helper.dart';

extension DateTimeExtension on DateTime {
  String formatDateTime(String formatter) {
    return sl<DateTimeHelper>().formatDateTime(
      dateTime: toLocal(),
      formatter: formatter.toString(),
    );
  }

  String agoDateTime() {
    return sl<DateTimeHelper>().agoDateTime(dateTime: this);
  }

  String timeLeft({int? days, DateTime? endDate}) {
    return sl<DateTimeHelper>().timeLeft(
      dateTime: this,
      days: days,
      endDate: endDate,
    );
  }
}

extension IntDateTimeCoveter on int {
  DateTime toDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(this);
  }
}

// Convert String to DateTime
extension StringDateTimeConverter on String {
  DateTime? toDateTime() {
    try {
      return DateTime.parse(this);
    } catch (e) {
      return null;
    }
  }
}
