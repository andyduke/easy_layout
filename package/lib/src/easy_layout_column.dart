import 'package:easy_layout/easy_layout.dart';
import 'package:flutter/widgets.dart';
import 'package:intersperse/intersperse.dart';

class EasyLayoutColumn extends StatelessWidget {
  final List<Widget> children;
  final double spacing;

  const EasyLayoutColumn({
    Key key,
    this.spacing,
    @required this.children,
  })  : assert(children != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final double vSpacing = spacing ?? EasyLayout.of(context)?.vSpacing ?? 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: children
          .intersperse(
            SizedBox(height: vSpacing),
          )
          .toList(),
    );
  }
}
