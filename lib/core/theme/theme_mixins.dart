import 'package:flutter/material.dart';
import 'package:nutri_kit/gen/colors.gen.dart';

mixin ThemeMixin {
  OutlineInputBorder border([Color color = ColorName.secondary]) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      );
}
