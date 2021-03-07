import 'package:easy_layout/easy_layout.dart';
import 'package:flutter/widgets.dart';

/// A widget that displays its children in a horizontal or
/// vertical array like a [Row] or [Column] widgets,
/// but with spacing and change the horizontal to vertical
/// layout when changing the screen width.
///
/// In a horizontal layout, child widgets are expanded.
///
/// By default inherits spacing from parent [EasyLayout].
///
/// The `toggleWidth` parameter specifies the minimum
/// width for a horizontal layout, if the width is
/// less than the specified one, the layout will switch
/// to a vertical layout.
///
class EasyLayoutAuto extends StatelessWidget {
  final List<Widget> children;
  final double hSpacing;
  final double vSpacing;
  final double toggleWidth;
  final Axis narrowMode;
  final Axis wideMode;

  EasyLayoutAuto({
    Key key,
    this.hSpacing,
    this.vSpacing,
    @required this.toggleWidth,
    @required this.children,
    this.narrowMode = Axis.vertical,
    this.wideMode = Axis.horizontal,
  })  : assert(toggleWidth != null),
        assert(children != null),
        assert(narrowMode != null),
        assert(wideMode != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final mode =
            (constraints.maxWidth <= toggleWidth) ? narrowMode : wideMode;
        if (mode == Axis.vertical) {
          return EasyLayoutColumn(
            spacing: vSpacing,
            children: children,
          );
        } else {
          return EasyLayoutRow(
            spacing: hSpacing,
            children: children,
          );
        }
      },
    );
  }
}
