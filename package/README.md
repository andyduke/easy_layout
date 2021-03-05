# EasyLayout

A set of widgets that make it easy to create a layout with specified spacing between child widgets.

## Getting Started

The layout needs to be wrapped with an `EasyLayout` widget, in which you can set the horizontal and vertical spacing between the child widgets by default.

You can place any widgets inside, if you need to place several widgets vertically, with specified distances between them, they must be wrapped with the `EasyLayoutColumn` widget.
```dart
EasyLayout(
  hSpacing: 24,
  vSpacing: 16,
  child: EasyLayoutColumn(
    children: [
      Container(
        width: 100,
        height: 100,
        color: Colors.orange,
      ),
      Container(
        width: 100,
        height: 100,
        color: Colors.teal,
      ),
    ],
  ),
)
```

Inside the `EasyLayout` with the specified child spacings, you can nest another `EasyLayout` with different child spacings, and all `EasyLayoutColumn`, `EasyLayoutRow` and `EasyLayoutAuto` within it will inherit the new values. 
```dart
EasyLayout(
  hSpacing: 24,
  vSpacing: 16,
  child: EasyLayoutColumn(
    children: [
      Container(
        width: 100,
        height: 100,
        color: Colors.orange,
      ),
      Container(
        width: 100,
        height: 100,
        color: Colors.teal,
      ),
      EasyLayout(
        vSpacing: 32,
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.cyan,
          ),
        ],
      ),
    ],
  ),
)
```

### Vertical layout

To arrange widgets vertically, wrap them with the `EasyLayoutColumn` widget.
```dart
EasyLayout(
  hSpacing: 24,
  vSpacing: 16,
  child: EasyLayoutColumn(
    children: [
      Container(
        width: 100,
        height: 100,
        color: Colors.orange,
      ),
      Container(
        width: 100,
        height: 100,
        color: Colors.teal,
      ),
    ],
  ),
)
```

### Horizontal layout

To arrange widgets horizontally, wrap them with the `EasyLayoutRow` widget.
```dart
EasyLayout(
  hSpacing: 24,
  vSpacing: 16,
  child: EasyLayoutRow(
    children: [
      Container(
        width: 100,
        height: 100,
        color: Colors.orange,
      ),
      Container(
        width: 100,
        height: 100,
        color: Colors.teal,
      ),
    ],
  ),
)
```

### Mixed layout

You can use `EasyLayoutColumn` and `EasyLayoutRow` widgets in any combination.
```dart
EasyLayout(
  hSpacing: 24,
  vSpacing: 16,
  child: EasyLayoutColumn(
    children: [
      Container(
        width: 100,
        height: 100,
        color: Colors.orange,
      ),
      Container(
        width: 100,
        height: 100,
        color: Colors.teal,
      ),

      // Row
      EasyLayoutRow(
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.orange,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.teal,
          ),
        ],
      ),
    ],
  ),
)
```

### Space distribution

To specify the ratio of space distribution between child widgets in `EasyLayoutColumn` or `EasyLayoutRow`, you can wrap child widgets in `EasyLayoutFlexible` widget and set the value in the `flex` parameter.
```dart
EasyLayout(
  hSpacing: 24,
  vSpacing: 16,
  child: EasyLayoutRow(
    children: [
      EasyLayoutFlexible(
        flex: 3,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.orange,
        ),
      ),
      EasyLayoutFlexible(
        flex: 7,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.teal,
        ),
      ),
    ],
  ),
)

```

### Auto layout

You can use the `EasyLayoutAuto` widget to change the horizontal to vertical layout when changing the screen width.

The `toggleWidth` parameter specifies the minimum width for a horizontal layout, if the width is less than the specified one, the layout will switch to a vertical layout.
```dart
EasyLayout(
  hSpacing: 24,
  vSpacing: 16,
  child: EasyLayoutAuto(
    toggleWidth: 768,
    children: [
      EasyLayoutFlexible(
        flex: 3,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.orange,
        ),
      ),
      EasyLayoutFlexible(
        flex: 7,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.teal,
        ),
      ),
    ],
  ),
)
```