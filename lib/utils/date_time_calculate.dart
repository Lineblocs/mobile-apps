DateTime getCurrentMonthStartDate() {
  DateTime now = DateTime.now();
  return DateTime(now.year, now.month, 1);
}

DateTime currentMonthStartDate = getCurrentMonthStartDate();

DateTime getCurrentMonthEndDate() {
  DateTime now = DateTime.now();
  DateTime startNextMonth = (now.month < 12)
      ? DateTime(now.year, now.month + 1, 1)
      : DateTime(now.year + 1, 1, 1);
  return startNextMonth.subtract(Duration(days: 1));
}

DateTime currentMonthEndDate = getCurrentMonthEndDate();

DateTime getLastMonthStartDate() {
  DateTime now = DateTime.now();
  DateTime startThisMonth = DateTime(now.year, now.month, 1);
  DateTime lastMonth = startThisMonth.subtract(Duration(days: 1));
  return DateTime(lastMonth.year, lastMonth.month, 1);
}

DateTime lastMonthStartDate = getLastMonthStartDate();

DateTime getLastMonthEndDate() {
  DateTime now = DateTime.now();
  DateTime startThisMonth = DateTime(now.year, now.month, 1);
  return startThisMonth.subtract(Duration(days: 1));
}

DateTime lastMonthEndDate = getLastMonthEndDate();

DateTime getCurrentYearStartDate() {
  DateTime now = DateTime.now();
  return DateTime(now.year, 1, 1);
}

DateTime currentYearStartDate = getCurrentYearStartDate();

DateTime getCurrentYearEndDate() {
  DateTime now = DateTime.now();
  return DateTime(now.year, 12, 31);
}

DateTime currentYearEndDate = getCurrentYearEndDate();

DateTime getLastYearStartDate() {
  DateTime now = DateTime.now();
  return DateTime(now.year - 1, 1, 1);
}

DateTime lastYearStartDate = getLastYearStartDate();

DateTime getLastYearEndDate() {
  DateTime now = DateTime.now();
  return DateTime(now.year - 1, 12, 31);
}

DateTime lastYearEndDate = getLastYearEndDate();

class DateUtils {
  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  static bool isSameWeek(DateTime date1, DateTime date2) {
    final DateTime startOfWeek1 = date1.subtract(Duration(days: date1.weekday));
    final DateTime startOfWeek2 = date2.subtract(Duration(days: date2.weekday));
    return startOfWeek1.year == startOfWeek2.year &&
        startOfWeek1.month == startOfWeek2.month &&
        startOfWeek1.day == startOfWeek2.day;
  }

  static bool isSameMonth(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month;
  }
}
