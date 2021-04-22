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
          padding: const EdgeInsets.symmetric(vertical: 32),
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

                // EasyLayoutRow with Spacers and Dividers
                EasyLayoutRow(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.orange,
                    ),
                    EasyLayoutSpacing(
                      hSpacing: 50,
                    ),
                    Container(
                      width: 100,
                      height: 70,
                      color: Colors.teal,
                    ),
                    EasyLayoutDivider(
                      axis: Axis.vertical,
                      thickness: 2,
                      color: Colors.red,
                      startIndent: 10,
                      endIndent: 10,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.amber,
                    ),
                  ],
                ),

                // EasyLayoutColumn with Spacers and Dividers
                EasyLayoutColumn(
                  spacing: 8,
                  children: [
                    Container(
                      width: 100,
                      height: 20,
                      color: Colors.orange,
                    ),
                    EasyLayoutSpacing(
                        // vSpacing: 30,
                        ),
                    Container(
                      width: 100,
                      height: 20,
                      color: Colors.teal,
                    ),
                    EasyLayoutDivider(
                      // axis: Axis.vertical,
                      thickness: 2,
                      color: Colors.red,
                      startIndent: 10,
                      endIndent: 10,
                    ),
                    Container(
                      width: 100,
                      height: 20,
                      color: Colors.amber,
                    ),
                  ],
                ),

                // Generic Row with Spacers
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.orange,
                      ),
                    ),
                    EasyLayoutSpacing(
                      hSpacing: 50,
                    ),
                    Expanded(
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.teal,
                      ),
                    ),
                    EasyLayoutSpacing(),
                    Expanded(
                      child: Builder(
                        builder: (context) => Container(
                          width: 100,
                          height: 100,
                          color: Colors.amber,
                          alignment: Alignment.center,
                          child: Text(
                              'h: ${EasyLayout.of(context)?.hSpacing}, v: ${EasyLayout.of(context)?.vSpacing}',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),

                // Fluid
                EasyLayoutFluid(
                  children: [
                    Fluidable(
                      fluid: 1,
                      minWidth: 200,
                      child: Container(
                        height: 100,
                        color: Colors.orange,
                      ),
                    ),
                    Fluidable(
                      fluid: 1,
                      minWidth: 300,
                      child: Container(
                        height: 100,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),

                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
