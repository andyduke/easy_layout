import 'package:easy_layout/easy_layout.dart';
import 'package:flutter/widgets.dart';

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
        final mode = (constraints.maxWidth <= toggleWidth) ? narrowMode : wideMode;
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
