import 'package:easy_layout/easy_layout.dart';
import 'package:flutter/material.dart';

/// A thin line widget that takes up a fixed amount of space around the line.
///
/// By default inherits spacings from parent [EasyLayout].
///
/// Can be used in [EasyLayoutColumn] and [EasyLayoutRow]
/// as well as [Column] and [Row], but not in [EasyLayoutAuto].
class EasyLayoutDivider extends StatelessWidget {
  /// Overlapping horizontal spacing inherited from EasyLayout.
  final double? hSpacing;

  /// Overlapping vertical spacing inherited from EasyLayout.
  final double? vSpacing;

  /// Divide the size of the spacing before and after the divider by 2.
  final bool halfSpacing;

  /// The axis along which the divider will be located and drawn.
  final Axis axis;

  /// The divider's size extent.
  ///
  /// The divider itself is always drawn as a horizontal or vertical line that is centered
  /// within the size specified by this value.
  ///
  /// If this is null, then the 0 is used.
  final double? size;

  /// The thickness of the line drawn within the divider.
  ///
  /// A divider with a [thickness] of 0.0 is always drawn as a line with a
  /// size of exactly one device pixel.
  ///
  /// If this is null, then the [DividerThemeData.thickness] is used. If
  /// that is also null, then this defaults to 0.0.
  final double? thickness;

  /// The color to use when painting the line.
  ///
  /// If this is null, then the [DividerThemeData.color] is used. If that is
  /// also null, then [ThemeData.dividerColor] is used.
  final Color? color;

  /// The amount of empty space to the leading edge of the divider.
  ///
  /// If this is null, then the [DividerThemeData.indent] is used. If that is
  /// also null, then this defaults to 0.0.
  final double? startIndent;

  /// The amount of empty space to the trailing edge of the divider.
  ///
  /// If this is null, then the [DividerThemeData.endIndent] is used. If that is
  /// also null, then this defaults to 0.0.
  final double? endIndent;

  /// Creates a divider.
  const EasyLayoutDivider({
    Key? key,
    this.hSpacing,
    this.vSpacing,
    this.halfSpacing = false,
    this.axis = Axis.horizontal,
    this.size = 0,
    this.thickness,
    this.color,
    this.startIndent,
    this.endIndent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EasyLayoutScope? parent = EasyLayout.of(context);

    double hPadding =
        hSpacing ?? parent?.hSpacing ?? EasyLayout.defaultHSpacing;
    double vPadding =
        vSpacing ?? parent?.vSpacing ?? EasyLayout.defaultVSpacing;
    if (halfSpacing) {
      hPadding = hPadding / 2;
      vPadding = vPadding / 2;
    }

    Widget divider = (axis == Axis.horizontal)
        ? Divider(
            height: size,
            thickness: thickness,
            color: color,
            indent: startIndent,
            endIndent: endIndent,
          )
        : VerticalDivider(
            width: size,
            thickness: thickness,
            color: color,
            indent: startIndent,
            endIndent: endIndent,
          );

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: (axis == Axis.vertical) ? hPadding : 0,
        vertical: (axis == Axis.horizontal) ? vPadding : 0,
      ),
      child: divider,
    );
  }
}
