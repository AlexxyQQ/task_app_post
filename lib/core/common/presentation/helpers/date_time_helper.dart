import 'package:intl/intl.dart';

import '../../../../config/constants/date_time/date_time_formatter_string.constant.dart';

class DateTimeHelper {
  String formatDateTime({
    required DateTime dateTime,
    String formatter = DateTimeFormatterString.abbreviatedDayMonthDayFormat,
  }) {
    return DateFormat(formatter).format(dateTime);
  }

  bool isToday(DateTime dateTime) {
    final DateTime now = DateTime.now();
    return now.year == dateTime.year &&
        now.month == dateTime.month &&
        now.day == dateTime.day;
  }

  String agoDateTime({required DateTime dateTime}) {
    final Duration difference = DateTime.now().difference(dateTime);

    if (difference.inDays >= 365) {
      final int years = (difference.inDays / 365).floor();
      return '${years}y ago';
    } else if (difference.inDays >= 30) {
      final int months = (difference.inDays / 30).floor();
      return '${months}m ago';
    } else if (difference.inDays >= 7) {
      final int weeks = (difference.inDays / 7).floor();
      return '${weeks}w ago';
    } else if (difference.inDays >= 1) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes}m ago';
    } else {
      return '${difference.inSeconds}s ago';
    }
  }

  String timeLeft({required DateTime dateTime, int? days, DateTime? endDate}) {
    final now = DateTime.now();

    // If reset days are provided, calculate days left in cycle
    if (days != null) {
      final nextResetDate = dateTime.add(Duration(days: days));

      // If there's an endDate, choose the minimum of reset date and end date
      final effectiveEndDate =
          endDate != null && endDate.isBefore(nextResetDate)
          ? endDate
          : nextResetDate;

      final remaining = effectiveEndDate.difference(now).inDays;

      if (remaining > 0) {
        return '$remaining day(s) left';
      } else {
        return 'Reset due';
      }
    }

    // Fallback to time ago logic
    final Duration difference = now.difference(dateTime);

    if (difference.inDays >= 365) {
      final int years = (difference.inDays / 365).floor();
      return '${years}y ago';
    } else if (difference.inDays >= 30) {
      final int months = (difference.inDays / 30).floor();
      return '${months}m ago';
    } else if (difference.inDays >= 7) {
      final int weeks = (difference.inDays / 7).floor();
      return '${weeks}w ago';
    } else if (difference.inDays >= 1) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes}m ago';
    } else {
      return '${difference.inSeconds}s ago';
    }
  }
}
