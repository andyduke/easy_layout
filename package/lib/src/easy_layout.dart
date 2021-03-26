import 'package:flutter/widgets.dart';

/// Sets a layout system with spacings for child widgets.
///
/// [EasyLayoutColumn], [EasyLayoutRow], [EasyLayoutAuto] and [EasyLayoutDivider]
/// widgets must be nested in at least one [EasyLayout] widget.
///
/// The default spacing values can be set through the static properties
/// `EasyLayout.defaultHSpacing` and `EasyLayout.defaultVSpacing`.
///
/// In any widget below [EasyLayout] in the tree, you can get spacing values
/// using `EasyLayout.of(context).hSpacing` and `EasyLayout.of(context).vSpacing`.
///
/// When using inline in a tree, you need to wrap the widget in a [Builder]
/// to pass the [EasyLayout] context inside:
/// ```dart
/// EasyLayout(
///   hSpacing: 24,
///   vSpacing: 32,
///   child: Builder(
///     builder: (context) => Text('Horizontal spacing: ${EasyLayout.of(context).hSpacing}'),
///   ),
/// )
/// ```
///
class EasyLayout extends StatelessWidget {
  static double defaultHSpacing = 24;
  static double defaultVSpacing = 32;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Merge with parent [EasyLayout]
  final bool merge;

  /// Horizontal spacing
  final double? hSpacing;

  /// Vertical spacing
  final double? vSpacing;

  const EasyLayout({
    Key? key,
    this.hSpacing,
    this.vSpacing,
    required this.child,
    this.merge = true,
  }) : super(key: key);

  static EasyLayoutScope? of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<EasyLayoutScope>();
    return scope;
  }

  @override
  Widget build(BuildContext context) {
    final EasyLayoutScope? parent =
        (merge && ((hSpacing == null) || (vSpacing == null)))
            ? EasyLayout.of(context)
            : null;
    return EasyLayoutScope(
      child: child,
      hSpacing: hSpacing ?? parent?.hSpacing ?? defaultHSpacing,
      vSpacing: vSpacing ?? parent?.vSpacing ?? defaultVSpacing,
    );
  }
}

/// Scope of [EasyLayout] containing values for horizontal and
/// vertical spacing. Can be accessed using `EasyLayout.of (context)`.
///
class EasyLayoutScope extends InheritedWidget {
  /// Horizontal spacing
  final double hSpacing;

  /// Vertical spacing
  final double vSpacing;

  EasyLayoutScope({
    Key? key,
    required Widget child,
    required this.hSpacing,
    required this.vSpacing,
  }) : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(covariant EasyLayoutScope oldWidget) {
    return (oldWidget.hSpacing != hSpacing) || (oldWidget.vSpacing != vSpacing);
  }
}
