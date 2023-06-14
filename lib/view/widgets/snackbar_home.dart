// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';

// void showAnimatedSnackbar(BuildContext context) {
//   const snackbarHeight = 150.0;
//   final controller = AnimationController(
//     vsync: Scaffold.of(context),
//     duration: Duration(milliseconds: 500),
//   );
//   final animation = CurvedAnimation(
//     parent: controller,
//     curve: Curves.easeInOut,
//   );
//   final scaffold = ScaffoldMessenger.of(context);

//   scaffold.hideCurrentSnackBar();
//   scaffold.showSnackBar(
//     SnackBar(
//       duration: Duration(seconds: 5),
//       content: AnimatedBuilder(
//         animation: animation,
//         builder: (context, child) {
//           return SizedBox(
//             height: snackbarHeight * animation.value,
//             child: child,
//           );
//         },
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Row(
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.blue,
//                   child: Icon(Icons.calendar_today),
//                 ),
//                 SizedBox(width: 16),
//                 Text('My Appointments'),
//                 Spacer(),
//                 Icon(Icons.arrow_forward_ios),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.green,
//                   child: Icon(Icons.person),
//                 ),
//                 SizedBox(width: 16),
//                 Text('Profile'),
//                 Spacer(),
//                 Icon(Icons.arrow_forward_ios),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.orange,
//                   child: Icon(Icons.settings),
//                 ),
//                 SizedBox(width: 16),
//                 Text('Settings'),
//                 Spacer(),
//                 Icon(Icons.arrow_forward_ios),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.red,
//                   child: Icon(Icons.logout),
//                 ),
//                 SizedBox(width: 16),
//                 Text('Log Out'),
//                 Spacer(),
//                 Icon(Icons.arrow_forward_ios),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
//   controller.forward();
// }


