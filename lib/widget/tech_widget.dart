import 'package:flutter/material.dart';
import 'package:folio/configs/app_dimensions.dart';
import 'package:folio/configs/app_theme.dart';
import 'package:folio/configs/app_typography.dart';

// ignore: must_be_immutable
class ToolTechWidget extends StatelessWidget {
  int flex = 0;
  final String techName;
  TextStyle? style;
  double bottomPadding;

  ToolTechWidget({Key? key, required this.techName, this.flex = 0, this.style, this.bottomPadding=0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
           padding: EdgeInsets.only(top: bottomPadding),
          child: Icon(
            Icons.play_arrow,
            color: AppTheme.c!.primary,
            size: AppDimensions.normalize(6),
          ),
        ),
        Expanded(
          flex: flex,
          child: Text(
            "$techName  ",
            style: style ?? AppText.l1b,
          ),
        )
      ],
    );
  }
}
