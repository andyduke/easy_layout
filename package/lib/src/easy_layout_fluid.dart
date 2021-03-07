import 'package:fluid_kit/fluid_kit.dart';
import 'package:flutter/widgets.dart';

import 'easy_layout.dart';

/// [EasyLayoutFluid] is like a [Wrap] with a fluid layout algorithm.
///
/// Like a normal [Wrap] widget with `direction = Axis.horizontal`,
/// [EasyLayoutFluid] displays its children in rows, but resizes it to fit
/// `fluid` and `minWidth`.
///
/// It will leave `hSpacing` horizontal space between each child,
/// and it will leave `vSpacing` vertical space between each line.
///
/// By default inherits spacings from parent [EasyLayout].
///
/// This is a wrapper around the [Fluid] widget (https://pub.dev/packages/fluid_kit).
///
class EasyLayoutFluid extends StatelessWidget {
  final double hSpacing;
  final double vSpacing;
  final List<Fluidable> children;

  const EasyLayoutFluid({
    Key key,
    this.hSpacing,
    this.vSpacing,
    this.children = const <Fluidable>[],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EasyLayoutScope parent = ((hSpacing == null) || (vSpacing == null))
        ? EasyLayout.of(context)
        : null;
    return Fluid(
      spacing: hSpacing ?? parent?.hSpacing,
      lineSpacing: vSpacing ?? parent?.vSpacing,
      children: children,
    );
  }
}
