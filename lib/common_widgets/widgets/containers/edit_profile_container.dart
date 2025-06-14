// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class EditProfileContainer extends StatelessWidget {
//   final Function() onTap;
//   final IconData icon;
//   final String title;
//
//   const EditProfileContainer(
//       {super.key,
//       required this.onTap,
//       required this.icon,
//       required this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 60,
//         width: 330,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(color: Colors.green, width: 1)),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Icon(
//                   icon,
//                   size: 30,
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Text(
//                   title,
//                   style: const TextStyle(
//                       fontWeight: FontWeight.w400, fontSize: 15),
//                 )
//               ],
//             ),
//             const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Icon(Icons.draw),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
