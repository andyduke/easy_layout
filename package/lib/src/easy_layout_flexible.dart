import 'package:flutter/widgets.dart';

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
