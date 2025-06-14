import 'package:flutter/material.dart';

class LongErrorButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool isLoading;

  const LongErrorButton (
      {super.key,
        required this.onTap,
        required this.title,
        required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 390,
        height: 55,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(20)),
        child: isLoading
            ? const Center(
          child: SizedBox(
              width: 35,
              height: 35,
              child: CircularProgressIndicator(
                color: Colors.white,
              )),
        )
            : Center(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}