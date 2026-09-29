class NextAssemblyData {
  final String date;
  final String time;
  final String bidDeadlineDate;
  final String bidDeadlineTime;
  final bool isScheduled;

  const NextAssemblyData({
    required this.date,
    required this.time,
    required this.bidDeadlineDate,
    required this.bidDeadlineTime,
    required this.isScheduled,
  });
}
