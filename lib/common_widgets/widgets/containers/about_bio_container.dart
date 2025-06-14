// import 'package:flutter/material.dart';
// import 'package:mylearning/util/validation/validation.dart';
//
// class AboutBioContainer extends StatelessWidget {
//   final TextEditingController controller;
//   String? Function(String?)? validator;
//
//   AboutBioContainer(
//       {super.key, required this.controller, required this.validator});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 330,
//       child: TextFormField(
//         controller: controller,
//         validator: validator,
//         maxLines: 7,
//         decoration: InputDecoration(
//           hintText: "Add a bio",
//           border: OutlineInputBorder(
//               borderSide: const BorderSide(color: Colors.green),
//               borderRadius: BorderRadius.circular(20)),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide: const BorderSide(
//               color: Colors.green,
//               width: 1,
//             ),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide: const BorderSide(
//               color: Colors.green,
//               width: 0.7,
//             ),
//           ),
//           filled: true,
//           fillColor: Colors.white,
//         ),
//       ),
//     );
//   }
// }
