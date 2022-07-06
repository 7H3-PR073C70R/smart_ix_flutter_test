import 'package:equatable/equatable.dart';

class RoutineEntity extends Equatable {
  const RoutineEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.icon,
    this.repeatedDays,
    required this.action,
  });

  final String id;
  final String name;
  final bool status;
  final String icon;
  final bool action;
  final List<String>? repeatedDays;

  @override
  List<Object> get props => [
        id,
        name,
        status,
        icon,
      ];
}
