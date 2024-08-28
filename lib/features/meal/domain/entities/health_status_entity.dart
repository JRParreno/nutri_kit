class HealthStatusEntity {
  HealthStatusEntity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.description,
  });

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? status;
  final String? description;
}
