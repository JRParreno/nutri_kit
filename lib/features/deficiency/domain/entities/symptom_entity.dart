class SymptomEntity {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String description;

  SymptomEntity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.description,
  });
}
