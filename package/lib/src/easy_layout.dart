import 'package:flutter/widgets.dart';

class EasyLayout extends StatelessWidget {
  static double defaultHSpacing = 24;
  static double defaultVSpacing = 32;

  final Widget child;
  final double _hSpacing;
  final double _vSpacing;

  const EasyLayout({
    Key key,
    double hSpacing,
    double vSpacing,
    @required this.child,
  })  : assert(child != null),
        _hSpacing = hSpacing,
        _vSpacing = vSpacing,
        super(key: key);

  static EasyLayout of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_EasyLayoutScope>();
    return scope?.layout;
  }

  /// Horizontal spacing
  double get hSpacing => _hSpacing ?? defaultHSpacing;

  /// Vertical spacing
  double get vSpacing => _vSpacing ?? defaultVSpacing;

  @override
  Widget build(BuildContext context) {
    return _EasyLayoutScope(
      child: child,
      layout: this,
    );
  }
}

class _EasyLayoutScope extends InheritedWidget {
  final EasyLayout layout;

  _EasyLayoutScope({
    Key key,
    @required Widget child,
    @required this.layout,
  }) : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(covariant _EasyLayoutScope oldWidget) {
    return (oldWidget.layout != layout);
  }
}
