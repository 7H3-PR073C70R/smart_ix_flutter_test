import 'package:equatable/equatable.dart';
import 'package:smart_ix_takehome/src/core/utils/services_type.dart';

class ServiceEntity extends Equatable {
  const ServiceEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.details,
    required this.icon,
  });

  final String id;
  final String name;
  final ServiceType type;
  final String details;
  final String icon;

  @override
  List<Object> get props => [
        id,
        name,
        type,
        details,
        icon,
      ];
}
