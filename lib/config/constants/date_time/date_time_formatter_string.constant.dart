class DateTimeFormatterString {
  /// Full day of the week, full month, day of the month, and year (e.g., "Thursday, April 23, 2024").
  static const String fullDayOfWeekMonthDayYear = 'EEEE, MMMM d, y';

  /// Full month, day of the month, and year (e.g., "April 23, 2024").
  static const String fullMonthDayYear = 'MMMM d, y';

  /// Full month, day of the month (e.g., "April 23").
  static const String fullMonthDay = 'MMMM d';

  /// Full  day of the month , month (e.g., "23 April").
  static const String fullDayMonth = 'd MMMM';

  /// Day of week Full month, day of the month (e.g.,  "Tue 23 April").
  static const String fullWeekMonthDay = 'EEE d MMMM';

  /// Abbreviated month, day of the month, and year (e.g., "Apr 23, 2024").
  static const String abbreviatedMonthDayYear = 'MMM d, y';

  /// Year, month, and day (e.g., "2024-04-23").
  static const String yearMonthDay = 'y-MM-dd';

  /// Month, day, and year in the format often used in the United States (e.g., "04/23/2024").
  static const String monthDayYearUS = 'MM/dd/yyyy';

  /// Day, month, and year in the format often used in many countries (e.g., "23/04/2024").
  static const String dayMonthYear = 'dd/MM/yyyy';

  /// Year, abbreviated month, and day (e.g., "2024-Apr-23").
  static const String yearAbbreviatedMonthDay = 'y-MMM-dd';

  /// Year (2 digits), month, and day (e.g., "24-04-23").
  static const String year2DigitMonthDay = 'yy-MM-dd';

  /// Format for an abbreviated day of the week, abbreviated month, and day of the month (e.g., "Thu Apr 23").
  static const String abbreviatedDayMonthDayFormat = 'E MMM d';

  /// This format represents a date and time with the following components:
  /// - `YYYY`: Four-digit year (e.g., 2022).
  /// - `MM`: Two-digit month (01 for January, 02 for February, ..., 12 for December).
  /// - `DD`: Two-digit day of the month (01 to 31).
  /// - `T`: Separator between date and time components.
  /// - `HH`: Two-digit hour of the day in 24-hour format (00 to 23).
  /// - `MM`: Two-digit minute of the hour (00 to 59).
  ///
  /// Example:
  /// - "2022-04-25T13:30": Represents April 25, 2022, at 1:30 PM.
  static const String standardDateTimeFormat = 'yyyy-MM-ddTHH:mm';

  //FOR TIME

  /// Format for 12-hour time format with AM/PM marker (e.g., "3:30 PM").
  static const String civilianTime = 'h:mm a';

  /// Format for 24-hour time format (e.g., "15:30").
  static const String militaryTime = 'HH:mm';
}
