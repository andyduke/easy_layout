import 'package:flutter/widgets.dart';
import '_intersperse.dart';
import 'easy_layout.dart';
import 'easy_layout_spacing.dart';

/// A widget that displays its children in a vertical array
/// like a [Column] widget, but with vertical spacing.
///
/// By default inherits spacing from parent [EasyLayout].
///
class EasyLayoutColumn extends StatelessWidget {
  /// The widgets below this widget in the tree.
  final List<Widget> children;

  /// Space between children.
  final double spacing;

  /// How the children should be placed along the cross axis.
  /// The default is [CrossAxisAlignment.stretch].
  final CrossAxisAlignment alignment;

  const EasyLayoutColumn({
    Key key,
    this.spacing,
    @required this.children,
    this.alignment = CrossAxisAlignment.stretch,
  })  : assert(children != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final double vSpacing = spacing ?? EasyLayout.of(context)?.vSpacing ?? 0;
    return Column(
      crossAxisAlignment: alignment,
      mainAxisSize: MainAxisSize.min,
      children: intersperseCustom<Widget>(
        (element, previous) {
          if (element is EasyLayoutSpacing || previous is EasyLayoutSpacing)
            return null;
          return SizedBox(height: vSpacing);
        },
        children,
      ).toList(),
    );
  }
}
