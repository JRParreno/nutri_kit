// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  VitaminEntity copyWith({
    int? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    String? description,
    String? image,
    bool? isFavorite,
  }) {
    return VitaminEntity(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
