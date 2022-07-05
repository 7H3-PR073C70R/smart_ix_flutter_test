import 'package:equatable/equatable.dart';

class DeviceEntity extends Equatable {
  const DeviceEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.status,
    required this.icon,
  });

  final String id;
  final String name;
  final String type;
  final bool status;
  final String icon;

  @override
  List<Object> get props => [
        id,
        name,
        type,
        status,
        icon,
      ];
}
