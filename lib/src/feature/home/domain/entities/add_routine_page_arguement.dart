import 'package:smart_ix_takehome/src/feature/home/domain/entities/routine_entity.dart';

class AddRoutinePageArguement {
  const AddRoutinePageArguement({
    required this.name,
    required this.action,
    required this.imagePath,
    this.routine,
  });
  final String name;
  final bool action;
  final String imagePath;
  final RoutineEntity? routine;
}
