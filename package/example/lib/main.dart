import 'package:easy_layout/easy_layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyLayout Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EasyLayout.defaultHSpacing = 24;
    EasyLayout.defaultVSpacing = 16;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: EasyLayout(
            // hSpacing: 24,
            // vSpacing: 16,
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

                // Row (widths)
                EasyLayoutRow(
                  spacing: 16,
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

                // Responsive
                EasyLayoutAuto(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
