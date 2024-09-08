// coverage:ignore-file

// ignore_for_file: avoid_field_initializers_in_const_classes

import 'package:flutter/material.dart';
import 'package:nutri_kit/core/common/widgets/spaced_linear_widget.dart';

/// A custom widget similar to [Column], but allows
/// setting the [spacing] between each [children].
class SpacedColumn extends SpacedLinearLayout {
  const SpacedColumn({
    super.key,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    super.children,
    super.spacing,
  });

  @override
  final Axis axis = Axis.vertical;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      // ignore: avoid-returning-widgets
      children: getChildren(),
    );
  }
}
