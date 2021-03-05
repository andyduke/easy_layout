import 'package:easy_layout/easy_layout.dart';
import 'package:flutter/widgets.dart';
import 'package:intersperse/intersperse.dart';

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
      children: children
          .map<Widget>((child) {
            if (child is Flexible) return child;

            final int flex = (child is EasyLayoutFlexible) ? child.flex : 1;
            return Expanded(
              flex: flex,
              child: child,
            );
          })
          .intersperse(
            SizedBox(width: hSpacing),
          )
          .toList(),
    );
  }
}
