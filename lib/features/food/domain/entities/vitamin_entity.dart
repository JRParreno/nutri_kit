import 'package:equatable/equatable.dart';

class VitaminEntity extends Equatable {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String description;
  final String? image;
  final bool isFavorite;

  const VitaminEntity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.description,
    this.image,
    this.isFavorite = false,
  });

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        name,
        description,
        image,
        isFavorite,
      ];
}
