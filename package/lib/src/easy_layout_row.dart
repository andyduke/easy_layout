import 'package:flutter/widgets.dart';
import '_intersperse.dart';
import 'easy_layout.dart';
import 'easy_layout_spacing.dart';

/// A widget that displays its children in a horizontal array
/// like a [Row] widget, but with vertical spacing and
/// expanding the children.
///
/// By default inherits spacing from parent [EasyLayout].
///
class EasyLayoutRow extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final MainAxisAlignment alignment;

  const EasyLayoutRow({
    Key key,
    this.spacing,
    @required this.children,
    this.alignment = MainAxisAlignment.spaceBetween,
  })  : assert(children != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final double hSpacing = spacing ?? EasyLayout.of(context)?.hSpacing ?? 0;

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: alignment,
      children: intersperseCustom<Widget>(
        (element, previous) {
          if (element is EasyLayoutSpacing || previous is EasyLayoutSpacing)
            return null;
          return SizedBox(width: hSpacing);
        },
        children.map<Widget>(
          (child) {
            if (child is Flexible) return child;
            if (child is EasyLayoutSpacing) return child;

            final int flex = (child is EasyLayoutFlexible) ? child.flex : 1;
            return Expanded(
              flex: flex,
              child: child,
            );
          },
        ),
      ).toList(),
    );
  }
}
