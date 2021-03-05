import "dart:collection";
import 'package:easy_layout/easy_layout.dart';
import 'package:flutter/widgets.dart';

enum EasyLayoutResponsiveMode {
  column,
  row,
}

@deprecated
class EasyLayoutResponsive extends StatelessWidget {
  final List<Widget> children;
  final double hSpacing;
  final double vSpacing;
  final SplayTreeMap<double, EasyLayoutResponsiveMode> rules;
  final EasyLayoutResponsiveMode defaultMode;

  EasyLayoutResponsive({
    Key key,
    this.hSpacing,
    this.vSpacing,
    @required Map<double, EasyLayoutResponsiveMode> rules,
    @required this.children,
    this.defaultMode = EasyLayoutResponsiveMode.row,
  })  : assert(rules != null),
        assert(children != null),
        assert(defaultMode != null),
        rules = SplayTreeMap.of(rules),
        super(key: key);

  EasyLayoutResponsiveMode _findMode(double width) {
    final entry = rules.entries.firstWhere((rule) {
      return rule.key > width;
    }, orElse: () => MapEntry(null, defaultMode));
    return entry.value;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final mode = _findMode(constraints.maxWidth);
        if (mode == EasyLayoutResponsiveMode.column) {
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
