import 'package:flutter/widgets.dart';

/// A widget that controls how a child of a EasyLayoutRow or EasyLayoutAuto flexes.
///
/// See also:
/// * [Flexible], which works similarly for [Column], [Row], and [Flex].
/// * [Space distribution explanation](https://pub.dev/packages/easy_layout#space-distribution)
///
class EasyLayoutFlexible extends StatelessWidget {
  final Widget child;
  final double flex;

  const EasyLayoutFlexible({
    Key key,
    this.flex,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
