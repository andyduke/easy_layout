import 'package:easy_layout/easy_layout.dart';
import 'package:flutter/widgets.dart';
import '_intersperse.dart';
import 'easy_layout.dart';
import 'easy_layout_flexible.dart';
import 'easy_layout_spacing.dart';

/// A widget that displays its children in a horizontal array
/// like a [Row] widget, but with vertical spacing and
/// expanding the children (optional).
///
/// By default inherits spacing from parent [EasyLayout].
///
class EasyLayoutRow extends StatelessWidget {
  /// The widgets below this widget in the tree.
  final List<Widget> children;

  /// Space between children.
  final double? spacing;

  /// How the children should be placed along the main axis.
  final MainAxisAlignment alignment;

  /// Stretch items to fill the entire row.
  final bool expand;

  const EasyLayoutRow({
    Key? key,
    this.spacing,
    required this.children,
    this.alignment = MainAxisAlignment.spaceBetween,
    this.expand = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double hSpacing = spacing ??
        EasyLayout.of(context)?.hSpacing ??
        EasyLayout.defaultHSpacing;
    bool hasVerticalDividers = false;

    Widget result = Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: alignment,
      children: intersperseCustom<Widget>(
        (element, previous) {
          if ((element is EasyLayoutSpacing || previous is EasyLayoutSpacing) ||
              (element is EasyLayoutDivider || previous is EasyLayoutDivider))
            return null;
          return SizedBox(width: hSpacing);
        },
        children.map<Widget>(
          (child) {
            if ((child is EasyLayoutDivider) && (child.axis == Axis.vertical))
              hasVerticalDividers = true;

            if (child is Flexible) return child;
            if (child is EasyLayoutSpacing || child is EasyLayoutDivider)
              return child;

            final int? flex = (child is EasyLayoutFlexible) ? child.flex : 1;
            return (expand && flex != null)
                ? Expanded(
                    flex: flex,
                    child: child,
                  )
                : child;
          },
        ),
      ).toList(),
    );

    if (hasVerticalDividers) {
      result = IntrinsicHeight(
        child: result,
      );
    }

    return result;
  }
}
