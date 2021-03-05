import 'package:easy_layout/easy_layout.dart';
import 'package:flutter/widgets.dart';

@deprecated
class EasyLayoutAutoWrap extends StatelessWidget {
  final List<Widget> children;
  final double hSpacing;
  final double vSpacing;
  final double toggleWidth;
  final Axis narrowMode;
  final Axis wideMode;

  EasyLayoutAutoWrap({
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
        final mode = (constraints.maxWidth <= toggleWidth) ? narrowMode : wideMode;
        if (mode == Axis.vertical) {
          return EasyLayoutColumn(
            spacing: vSpacing,
            children: children,
          );
        } else {
          final layout = EasyLayout.of(context);
          final double spacing = hSpacing ?? layout?.hSpacing ?? 0;
          final double runSpacing = vSpacing ?? layout?.vSpacing ?? 0;

          return Wrap(
            alignment: WrapAlignment.spaceBetween,
            spacing: spacing,
            runSpacing: runSpacing,

            // runAlignment: WrapAlignment.spaceBetween,
            // crossAxisAlignment: WrapCrossAlignment.center,
            children: children,
          );

          // return EasyLayoutRow(
          //   spacing: hSpacing,
          //   children: children,
          // );
        }
      },
    );
  }
}
