class AddRoutinePageState {
  const AddRoutinePageState({
    this.time = '03:00 AM',
    this.days = const [],
  });

  final String time;
  final List<String> days;

  AddRoutinePageState copyWith({
    String? time,
    List<String>? days,
  }) {
    return AddRoutinePageState(
      time: time ?? this.time,
      days: days ?? this.days,
    );
  }
}
