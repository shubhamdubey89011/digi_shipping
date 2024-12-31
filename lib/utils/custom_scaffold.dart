// import 'package:flutter/material.dart';

// Widget customScaffold({
//   required Widget body,
//   Widget? floatingActionButton,
//   List<Widget>? actions,
//   Widget? drawer, // Left-side drawer
//   Widget? endDrawer, // Right-side drawer
//   Widget? bottomNavigationBar,
//   PreferredSizeWidget? appBar,
// }) {
//   return Scaffold(
//     appBar: appBar ??
//         AppBar(
//           actions: actions,
//         ),
//     body: body,
//     floatingActionButton: floatingActionButton,
//     drawer: drawer, // Left-side drawer
//     endDrawer: endDrawer, // Right-side drawer
//     bottomNavigationBar: bottomNavigationBar,
//     backgroundColor: const Color.fromRGBO(240, 238, 255, 1),
//   );
// }


// Custom Scaffold
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;

  const CustomScaffold({
    Key? key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}