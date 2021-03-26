import 'package:flutter/widgets.dart';
import 'easy_layout.dart';

/// A widget that takes a fixed amount of space in the direction of its parent.
///
/// By default inherits spacings from parent [EasyLayout].
///
/// Can be used in [EasyLayoutColumn], [EasyLayoutRow] and [EasyLayoutAuto],
/// as well as [Column] and [Row].
class EasyLayoutSpacing extends StatelessWidget {
  final double? hSpacing;
  final double? vSpacing;

  const EasyLayoutSpacing({
    Key? key,
    this.hSpacing,
    this.vSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EasyLayoutScope? parent = EasyLayout.of(context);
    return SizedBox(
      width: hSpacing ?? parent?.hSpacing ?? EasyLayout.defaultHSpacing,
      height: vSpacing ?? parent?.vSpacing ?? EasyLayout.defaultVSpacing,
    );
  }
}
